class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :time
      t.integer :room
      t.integer :seats, array: true, default: []
      t.date :day
      t.timestamps
    end
  end
end
