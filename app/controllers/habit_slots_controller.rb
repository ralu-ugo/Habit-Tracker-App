class HabitSlotsController < ApplicationController
  before_action :set_habit, only: %i[create update destroy]

  # def new
  #   @habit = HabitSlot.new
  # end

  def create(habitslot_params)
    @habitslot = Habit.new(habitslot_params)
    @habitslot.habit = @habit
    # @habit.user_id = current_user.id
    @habitslot.habit = @habit
    if @habit.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  def update(habitslot_params)
    if @habit.update(habitslot_params)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @habitslot = HabitSlot.find(params[:id])
    @habitslot.destroy
  end

  private

  def set_habit
    @habit = Habit.find(params[:habit_id])
  end

  # def habit_params
  #   params.require(:habit).permit(:title, :description, :favourite, :start_date, :end_date, :repeat, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :user_id)
  # end
end
