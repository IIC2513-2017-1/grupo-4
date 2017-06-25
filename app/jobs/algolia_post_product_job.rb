require "algolia_api"

class AlgoliaPostProductJob < ApplicationJob
  queue_as :default

  def perform(product)
    api = AlgoliaApi.new
    api.post_product(product)
  end
end
