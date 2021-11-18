class SchedulesController < ApplicationController
  def show
    @schedule = Schedule.find_by(id: params[:id])
    @movie = @schedule.movie
  end

  def reserve
    movie_params
    puts(params["seats"])
    if !params["row"] || !params["seats"]
      puts "no row or no seat!!!"
    else
      @schedule = Schedule.find_by(id: params[:id])
      @occupied_seats = Array.new
      @reserved = Array.new
      params["seats"].each do |seat|
        if @schedule.seats[params["row"].to_i][seat.to_i] == 1
          @occupied_seats.push(seat)
        else
          @schedule.seats[params["row"].to_i][seat.to_i] = 1
          @reserved.push(seat)
        end
      end
      puts "@@", @reserved, "--", @occupied_seats
      @schedule.save
      redirect_to "/schedules/#{@schedule.id}#row=#{row_n_to_let(params[:row])}"
    end

    render :show
    
  end

  private
  
  def movie_params
    params.permit(:row, :seats)
  end

  def row_n_to_let(row)
    return {0 => :A, 1 => :B, 2 => :C, 3 => :D}[row.to_i]
  end
end
