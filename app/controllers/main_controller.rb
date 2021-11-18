class MainController < ApplicationController
    def index
        @movies = Movie.all
        @schedules = Schedule.all
        @current_date = Date.current

        unless @movies.empty?
          end_day = @movies.map { |movie| movie.end_date }.sort.last
          @days = (@current_date..end_day).to_a

          @selected_day = params[:day]
          if @selected_day
            @selected_day = Date.strptime(@selected_day, "%Y-%m-%d")
            @movies = Movie.where("start_date <= ? AND end_date >= ?", @selected_day, @selected_day)
            @schedules_matine = Schedule.where("day = ? AND time = ?", @selected_day, 'matine')
            @schedules_tanda = Schedule.where("day = ? AND time = ?", @selected_day, 'tanda')
            @schedules_noche = Schedule.where("day = ? AND time = ?", @selected_day, 'noche')
          else
            @movies = Movie.where("start_date <= ? AND end_date >= ?", @current_date, @current_date)
            @schedules_matine = Schedule.where("day = ? AND time = ?", @current_date, 'matine')
            @schedules_tanda = Schedule.where("day = ? AND time = ?", @current_date, 'tanda')
            @schedules_noche = Schedule.where("day = ? AND time = ?", @current_date, 'noche')
          end
        end
    end
end
