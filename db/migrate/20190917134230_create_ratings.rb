class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :restaurant, foreign_key: true
      t.integer :rate

      t.timestamps
    end
  end
end
