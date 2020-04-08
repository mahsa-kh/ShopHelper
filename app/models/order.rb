class Order < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :driver
  has_many :items, through: :shopping_list
  validates :status, presence: true
end
