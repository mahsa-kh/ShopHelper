class AddFirstNameLastNameLocationAvailableRatingToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :first_name, :string
    add_column :drivers, :last_name, :string
    add_column :drivers, :location, :string
    add_column :drivers, :available, :boolean, default: false
    add_column :drivers, :rating, :integer
  end
end
