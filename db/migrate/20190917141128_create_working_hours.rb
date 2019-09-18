class CreateWorkingHours < ActiveRecord::Migration[5.2]
  def change
    create_table :working_hours do |t|
      t.references :restaurant, foreign_key: true
      t.integer :week_day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
