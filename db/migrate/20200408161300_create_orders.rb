class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.boolean :status
      t.references :shopping_list, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
