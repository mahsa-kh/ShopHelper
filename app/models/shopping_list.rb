class ShoppingList < ApplicationRecord
  belongs_to :user
  has_one :order, dependent: :destroy
  has_one :driver, through: :order
  has_many :items, dependent: :destroy
end
