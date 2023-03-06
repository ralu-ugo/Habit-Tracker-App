class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find[params[:id]]
  end

  def new
    @schedule = Schedule.new
  end

  # def create
  #   @schedule = Schedule.create
  #   if @schedule.save
  #     redirect_to pages_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def edit
  #   @schedule = Schedule.find[params[:id]]
  # end

  # def update
  #   @schedule = Schedule.find[params[:id]]
  #   @schedule.update(schedule_params)
  #   redirect_to shoes_path
  # end

  # def schedule_params
  #   params.require(:schedule).permit(:habit, :user)
  # end
end
