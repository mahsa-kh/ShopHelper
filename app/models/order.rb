class Order < ApplicationRecord
  belongs_to :shopping_list, dependent: :destroy
  belongs_to :driver
  has_one :user, through: :shopping_list
  has_many :items, through: :shopping_list
end
