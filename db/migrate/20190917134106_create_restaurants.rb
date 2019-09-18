class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :cousine
      t.string :logo
      t.boolean :is_open, null: false, default: false

      t.timestamps
    end
  end
end
