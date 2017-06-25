require 'httparty'

class AlgoliaApi
    include HTTParty
    base_uri "https://#{Rails.application.secrets.algolia_application_id}.algolia.net"

    def initialize
        @options = {
            headers: {
                "X-Algolia-API-Key": Rails.application.secrets.algolia_api_key,
                "X-Algolia-Application-Id": Rails.application.secrets.algolia_application_id
            }
        }
        @index = Rails.application.secrets.algolia_index_name
    end

    def indeces
        self.class.get("/1/indexes", @options)
    end

    def post_product(product)
        self.class.put("/1/indexes/#{@index}/#{product.sku}", @options.merge({ :body => product.to_json }))
    end

    def patch_product(product)
        self.post_product(product)
    end

    def destroy_product(product)
        self.class.delete("/1/indexes/#{@index}/#{product.sku}", @options)
    end
end