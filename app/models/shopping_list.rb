class ShoppingList < ApplicationRecord
  belongs_to :user
  belongs_to :driver, through: :order
  has_many :orders
  has_many :items, dependent: :destroy
  validates :status, presence: true
end
