class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shopping_lists, through: :order
  has_many :orders
  validates :first_name, :last_name, :email, :password, :available, presence: true
  validates :email, uniqueness: true
  has_one_attached :photo
end
