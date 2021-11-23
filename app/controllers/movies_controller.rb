class MoviesController < ApplicationController
  def new
      @schedules = Schedule.all
      @reservation_error =  session[:reservation_error]
  end

  def create
    
    new_movie = Movie.create(
        {
          name: movie_params["name"], 
          imgURL: movie_params["imgURL"],
          start_date: movie_params["start_date"], 
          end_date: movie_params["end_date"]
        }
      )

      #before saving we check if there is other movie in the
      
      to_create = []
      
      movie_params["rooms"].each do |time_room|
        time = time_room.split(" ")[0].to_i
        room = time_room.split(" ")[1].to_i
        times = ["matine", "tanda", "noche"]
        time = times[time]   
        to_create.append({"time" => time, "room" => room})
      end
      range_dates = (new_movie.start_date..new_movie.end_date).to_a
      range_dates.each do |d|
        to_create.each do |to_c|
          aux = Schedule.find_by(day: d, room: to_c["room"], time: to_c["time"])
          if aux
            session[:reservation_error] = true
            new_movie.destroy()
            redirect_to '/movies/new?' and return 
          end
          new_schedule = Schedule.create({ time: to_c["time"], room: to_c["room"], 
          seats: Array.new(4) { Array.new(12) {0} }, day: d, movie: new_movie })
          new_schedule.save()
        end
      end
    new_movie.save()
    redirect_to '/'
  end

  private

  def movie_params
    params.permit(:name, :imgURL, :start_date, :end_date, :commit, :authenticity_token, rooms: [])
  end
end
