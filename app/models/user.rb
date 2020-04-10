class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one :shopping_list
  has_many :items, through: :shopping_list
  has_many :orders, through: :shopping_list
  validates :first_name, :last_name, :location, :email, :password, presence: true
  validates :email, uniqueness: true
end
