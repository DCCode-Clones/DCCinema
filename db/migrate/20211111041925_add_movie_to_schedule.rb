class AddMovieToSchedule < ActiveRecord::Migration[6.1]
  def change
    add_reference :schedules, :movie, null: false, foreign_key: true
  end
end
