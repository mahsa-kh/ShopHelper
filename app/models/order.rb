class Order < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :driver
  belongs_to :user, through: :shopping_list
  has_many :items, through: :shopping_list
  validates :status, presence: true
end
