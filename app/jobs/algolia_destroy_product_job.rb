require "algolia_api"

class AlgoliaDestroyProductJob < ApplicationJob
  queue_as :default

  def perform(product)
    api = AlgoliaApi.new
    api.destroy_product(product)
  end
end
