class SchedulesController < ApplicationController
  def show
    @schedule = Schedule.find_by(id: params[:id])
    @movie = @schedule.movie
  end

  def reserve
    movie_params
    puts(params["seats"])
    @schedule = Schedule.find_by(id: params[:id])
    for i in 0..11 do
      if params["seats"][i] == "1"
        @schedule.seats[params["row"].to_i][i] = 1 
      end
    end
    @schedule.save
    redirect_to "/schedules/#{@schedule.id}"
  end

  private
  
  def movie_params
    params.permit(:row, :seats)
  end
end
