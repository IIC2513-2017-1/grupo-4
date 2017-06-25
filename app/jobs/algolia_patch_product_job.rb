require "algolia_api"

class AlgoliaPatchProductJob < ApplicationJob
  queue_as :default

  def perform(product)
    api = AlgoliaApi.new
    api.patch_product(product)
  end
end
