class SchedulesController < ApplicationController
  def show
    @schedule = Schedule.find_by(id: params[:id])
    @movie = @schedule.movie
  end

  def reserve
    movie_params
    puts(params["seats"])
    @schedule = Schedule.find_by(id: params[:id])
    params["seats"].each do |seat|
      @schedule.seats[params["row"].to_i][seat.to_i] = 1
    end
    @schedule.save
    redirect_to "/schedules/#{@schedule.id}"
  end

  private
  
  def movie_params
    params.permit(:row, :seats)
  end
end
