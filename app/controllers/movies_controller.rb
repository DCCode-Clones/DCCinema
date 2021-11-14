class MoviesController < ApplicationController
  def new
  end

  def create
    new_movie = Movie.create(movie_params)
    new_movie.save()
    redirect_to '/'
  end

  private

  def movie_params
    params.permit(:name, :imgURL, :start_date, :end_date)
  end
end
