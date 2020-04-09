class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.string :quantity
      t.references :shopping_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
