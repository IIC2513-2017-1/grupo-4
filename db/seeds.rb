# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Fake common users
pass = "123"
users_list = []
for i in 0..9
    complete_name = Faker::StarWars.character
    name = complete_name.split(" ")[0]
    l_name = complete_name.split(" ")[1]    
    if l_name.nil?
        l_name = "Doe"
    end
    email = Faker::Internet.email(name)
    user = User.create!(email: email, first_name: name, last_name: l_name, role: 1, password: pass, password_confirmation: pass)
    users_list.insert(i, user)
end

# Fake admin user
User.create!(email: "admin@admin.cl", first_name: "Mr", last_name: "Admin", role: 0, password: pass, password_confirmation: pass)

# Fake categories
categories_list = [["Pisco", "El Pisco es un tipo de aguardiente de uvas que se produce en Chile y Perú", "piscola.jpg"], ["Vodka", " El Vodka es una bebida destilada. Se discute el origen de la misma aunque el nombre actual es ruso. Se produce generalmente a través de la fermentación de granos y otras plantas ricas en almidón, como el centeno, trigo, o patata.", "martini.jpg"],
                   ["Ron", "El ron es una bebida alcohólica, elaborada a partir de la caña de azúcar por fermentación, y que posteriormente puede o no estar sometido a procesos de añejamiento, generalmente en barricas de roble. Esta bebida se menciona por primera vez en documentos provenientes de Barbados en 1650.", "daiquiri.jpg"],
                   ["Tequila", "El tequila es un destilado originario del municipio de Tequila en el estado de Jalisco, México. Se elabora a partir de la fermentación y destilado al igual que el mezcal, jugo extraído del agave, en particular el llamado agave azul","sunrise.jpg"],
                   ["Vino","El vino es una bebida obtenida de la uva mediante la fermentación alcohólica de su mosto o zumo.2 La fermentación se produce por la acción metabólica de levaduras, que transforman los azúcares del fruto en etanol y el gas en forma de dióxido de carbono.","tinto.jpg"],
                   ["Cerveza", "La cerveza es una bebida alcohólica, no destilada, de sabor amargo, que se fábrica con granos de cebada germinados u otros cereales cuyo almidón se fermenta en agua con levadura.", "beer.jpg"],
                   ["Whisky", "El whisky es una bebida alcohólica obtenida por la destilación de la malta fermentada de cereales como cebada, trigo, centeno y maíz, y su posterior envejecimiento en barriles de madera, tradicionalmente de roble blanco.", "rocks.jpg"]]

categories = {}
for i in 0..6
    categories[categories_list[i][0]] = Category.create!(name: categories_list[i][0], description: categories_list[i][1], image: categories_list[i][2])
end

# Fake products
products_list = [[0, "Alto del Carmen", "Pisco de 750cc y 35°", 3990, "alto.jpg", "Pisco"], [1, "Mistral", "Pisco de 1L y 40°", 6990, "mistral.jpg", "Pisco"], [2, "Absolut Vodka", "Vodka de 750cc y 40°", 10990, "absolut.jpg", "Vodka"],
                 [3, "Smirnoff", "Vodka 750cc y 40°", 7990, "smirnoff.jpg", "Vodka"], [4, "Ron Flor de Caña", "Ron de 750cc y 40°", 9990, "flor.jpg", "Ron"], [5, "Bacardi Gold", "Ron de 750cc y 40°", 5990, "bacardi.jpg", "Ron"],
                 [6, "Olmeca Blanco", "Tequila de 750cc y 40°", 10000, "olmeca.jpg", "Tequila"], [7, "Tequila Sierra", "Tequila de 750cc y 40°", 7000, "sierra.jpg", "Tequila"], [8, "Viña Santa Helena", "Vino blanco 2L", 4500, "santa.jpg", "Vino"],
                 [9, "Viña Concha y Toro", "Carmenere de 750 cc, Series Riberas, Marqués de Casa Concha", 12000, "concha.jpg", "Vino"], [10, "Heineken", "Lata de cerveza Lager 350cc", 650, "heineken.jpg", "Cerveza"],
                 [11, "Cristal", "Lata de cerveza Lager 350cc", 450, "cristal.jpg", "Cerveza"], [12, "Johnnie Walker Black Label", "Whisky escoces 750cc", 22000, "johnnie.jpg", "Whisky"], [13, "Jack Daniel's", "Whisky 750cc", 19000, "jack.jpg", "Whisky"]]

products = []
for i in 0..13
    products.insert(i, Product.create!(sku: products_list[i][0], name: products_list[i][1], description: products_list[i][2], price: products_list[i][3], category_id: categories[products_list[i][-1]].id, image: Rails.root.join("app/assets/images/"+ products_list[i][4]).open))
end

# Fake comments
for i in 0..13
    for k in 0..2
        Comment.create!(body: Faker::StarWars.quote, user_id: users_list.sample.id, product_id: products[i].id)
    end
end
