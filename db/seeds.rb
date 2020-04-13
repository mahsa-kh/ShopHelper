require "faker"
Item.destroy_all
ShoppingList.destroy_all
Order.destroy_all
User.destroy_all
Driver.destroy_all


puts "Drivers Creation"
  # has_many :shopping_lists, through: :order
  # has_many :orders
  # validates :first_name, :last_name, :location, :available, presence: true
  3.times do
    driver = Driver.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      # location: Faker::Address.full_address,
      available: true,
      email: Faker::Internet.email, 
      password: Faker::Alphanumeric.alpha(number: 10)
      )
    driver.save
  end
puts "Drivers Created"


puts "Users Creation"
  # has_one :shopping_list
  # has_many :items, through: :shopping_list
  # has_many :orders, through: :shopping_list
  # validates :first_name, :last_name, :location, :email, :password, presence: true
  # validates :email, uniqueness: true
  10.times do
    user = User.new(
      first_name: Faker::Name.first_name, 
      last_name: Faker::Name.last_name, 
      location: Faker::Address.full_address, 
      email: Faker::Internet.email, 
      password: Faker::Alphanumeric.alpha(number: 10)
      )
    user.save
  end
puts "Users Created"


puts "ShoppingList Creation"
    User.all.each do |user|
    # belongs_to :user
    # has_one :driver, through: :order
    # has_one :order, dependent: :destroy
    # has_many :items, dependent: :destroy
    # validates :status, presence: true
    shopping_list = ShoppingList.new(status: true)
    shopping_list.user = user
      puts "Items Creation"
        5.times do
        item = Item.new(product_name: Faker::Food.vegetables, quantity: Faker::Measurement.metric_weight)
        # belongs_to :shopping_list
        # validates :product_name, :quantity, presence: true
        item.shopping_list = shopping_list 
        item.save
        end
        puts "Items Created"
    shopping_list.save!
    end
puts "ShoppingList Created"



puts "Orders Creation"
  # belongs_to :shopping_list
  # belongs_to :driver
  # has_one :user, through: :shopping_list
  # has_many :items, through: :shopping_list
  # validates :status, presence: true
  Driver.all.each do |driver|
    3.times do
      order = Order.new(
        status: true,
        shopping_list_id: (ShoppingList.all).sample.id
        )
      order.driver = driver # ---> driver.id <-----------
      order.save!
    end
  end
puts "Orders Created"
