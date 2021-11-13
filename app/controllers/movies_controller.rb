class MoviesController < ApplicationController
  def new
    @movie = Movie
  end

  def create
    Movie.create(user_params)
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :imgURL, :start_date, :end_date)
  end
end
