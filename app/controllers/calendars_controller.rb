class CalendarsController < ApplicationController
  # before_action :find_habit, only: %i[show edit update destroy]

  def index
    @calendars = Calendar.all
  end

  def show
    @calendar = Calendar.find(params[:id])
  end

  # def new
  #   @calendar = Calendar.new
  # end

  # def create
  #   @calendar = Calendar.new(habit_params)
  #   # @calendar.user_id = current_user.id
  #   if @calendar.save
  #     redirect_to habit_path(@calendar)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def edit
  # end

  # def update
  #   if @calendar.update(params[habit_params])
  #     redirect_to habit_path(@calendar)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @calendar.destroy
  #   redirect_to habits_path, status: :see_other
  # end

  # private

  # def find_habit
  #   @calendar = Calendar.find(params[:id])
  # end

  # def habit_params
  #   params.require(:calendar).permit(:start_date, :end_date, :calendar_type)
  # end
end
