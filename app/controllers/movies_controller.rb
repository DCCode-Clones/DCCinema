class MoviesController < ApplicationController
  def new
  end

  def create
    new_movie = Movie.create(movie_params)
    new_movie.save()
    range_dates = (new_movie.start_date..new_movie.end_date).to_a
    range_dates.each do |d|
      puts params[:time]
      new_schedule = Schedule.create(time: params[:time], room: params[:room], seats: Array.new(4) { Array.new(12) {0} }, day: d, movie: new_movie)
      new_schedule.save()
    end
    redirect_to '/'
  end

  private

  def movie_params
    params.permit(:name, :imgURL, :start_date, :end_date)
  end
end
