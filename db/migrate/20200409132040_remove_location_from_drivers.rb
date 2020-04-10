class RemoveLocationFromDrivers < ActiveRecord::Migration[6.0]
  def change

    remove_column :drivers, :location, :string
  end
end
