class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :items, dependent: :destroy
  validates :status, presence: true
end
