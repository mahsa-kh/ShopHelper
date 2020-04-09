class Item < ApplicationRecord
  belongs_to :shopping_list
  validates :product_name, :quantity, presence: true
end
