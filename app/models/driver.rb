class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shopping_lists, through: :order
  has_many :orders
  validates :first_name, :last_name, :location, :available, presence: true
end
