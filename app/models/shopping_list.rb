class ShoppingList < ApplicationRecord
  belongs_to :user
  has_one :driver, through: :order
  has_one :order, dependent: :destroy
  has_many :items, dependent: :destroy
  validates :status, presence: true
end
