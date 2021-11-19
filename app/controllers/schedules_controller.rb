class SchedulesController < ApplicationController
  def show
    @schedule = Schedule.find_by(id: params[:id])
    @movie = @schedule.movie
    @reservation_error =  session[:reservation_error] 
  end

  def reserve
    movie_params
    @schedule = Schedule.find_by(id: params[:id])
    session[:reservation_error] = false
    if !params["seats"]
      redirect_to "/schedules/#{@schedule.id}"  and return
    end
    params["seats"].each do |seat|
      if @schedule.seats[params["row"].to_i][seat.to_i] == 1
        session[:reservation_error] = true
        redirect_to "/schedules/#{@schedule.id}"  and return
      else
        session[:reservation_error] = false
      end
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
