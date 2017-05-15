# ¿No hay copete? iCopete
## Entrega 2
Un par de detalles sobre la entrega 2:

- La aplicación se encuentra corriendo en https://iic2513-grupo-4.herokuapp.com/
- Se implementaron los CRUDs de usuarios, productos y categorías.
- Se implementó adicionalmente un sistema de registro y login.
- Junto a lo anterior, se implementó un sistema de sesiones y roles de usuario. Lo anterior se
ve manifestado en que el botón "Usuarios" en la barra de navegación sólo es visible para usuarios
que sean administradores del sistema.
- Pese a lo anterior, se decidió dejar el sistema lo más abierto posible para no molestar con la
corrección (que entendemos no tenía como objetivo manejo de sesiones y roles).
- Se implementó un sistema de grillas en SASS.
- Se evitó a toda costa usar `scaffold`.
- Se implementaron las validaciones de frontend (usando la gema `simple_form`), en Rails (a través de los modelos) y
directamente en la base de datos (estableciendo restricciones mediante migraciones).
- Se implementaron las relaciones entre productos y categorías en los modelos.
- El landing page es estático (el jumbotron no cambia y las categorías de abajo tampoco), no obstante, no era el objetivo
de esta entrega y se presentó para dar una idea de cómo vemos la aplicación en el corto plazo.

## Entrega 3
Detalles sobre la entrega 3:

- Se implementó el sistema de comentarios para cada producto y que estos solo puedan ser agregados por un usuario que hace log in.
- Se implementó el uso de seeds para llenar de productos, usuarios y comentarios la pagina. Se hizo uso de Faker para generar algunos datos.
- Se implementó el sistema para subir imagenes utilizando carrierwave.
- Se implementó con manejo de sesiones los permisos y vistas que pueden ver los usuarios dependiendo del rol.
- Se implementó el carro de compras.
- El login encriptado fue implementado en la entrega pasada.