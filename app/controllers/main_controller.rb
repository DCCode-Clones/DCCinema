class MainController < ApplicationController
    def index
        @movies = Movie.all()
        @schedules = Schedule.all()
        start_day = @movies.map {|movie| movie.start_date }.sort.first
        end_day = @movies.map {|movie| movie.end_date }.sort.last
        @days = (start_day..end_day).to_a
    end

    def day
        day = params[:day]
        @movies = Movie.all()
        @schedules = Schedule.all()
        if day
            @movies = Movie.where("start_date <= ? AND end_date >= ?", day, day)
        end
        start_day = @movies.map {|movie| movie.start_date }.sort.first
        end_day = @movies.map {|movie| movie.end_date }.sort.last
        @days = (start_day..end_day).to_a
    end

end