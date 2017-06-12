class Transaction < ApplicationRecord
  after_initialize :default_values

  belongs_to :user
  belongs_to :shopping_cart

  def default_values
    self.dispatched = false if self.dispatched.nil?
  end
end
