class MainController < ApplicationController
    def index
        @movies = Movie.all()
        @schedules = Schedule.all()
        start_day = @movies.map {|movie| movie.start_date }.sort.first
        end_day = @movies.map {|movie| movie.end_date }.sort.last
        @days = (start_day..end_day).to_a
    end

    def day
        @selected_day = params[:day]
        @movies = Movie.all()
        @schedules = Schedule.all()
        if @selected_day
            @movies = Movie.where("start_date <= ? AND end_date >= ?", @selected_day, @selected_day)
        end
        start_day = @movies.map {|movie| movie.start_date }.sort.first
        end_day = @movies.map {|movie| movie.end_date }.sort.last
        @days = (start_day..end_day).to_a
        @schedules_matine = Schedule.where("day = ? AND time = ?", @selected_day, 'matine')
        @schedules_tanda = Schedule.where("day = ? AND time = ?", @selected_day, 'tanda')
        @schedules_noche = Schedule.where("day = ? AND time = ?", @selected_day, 'noche')
    end
end