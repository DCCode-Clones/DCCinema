class SchedulesController < ApplicationController
    def show
        @schedule = Schedule.find_by(id: params[:id])
        @movie = @schedule.movie
    end
end
