class HabitsController < ApplicationController
  before_action :find_habit, only: %i[show edit update destroy]

  def index
    @habits = Habit.all
  end

  def show
    @habit = Habit.find(params[:id])
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.user_id = current_user.id
    if @habit.save
      redirect_to habit_path(@habit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @habit.update(params[habit_params])
      redirect_to habit_path(@habit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @habit.destroy
    redirect_to habits_path, status: :see_other
  end

  private

  def find_habit
    @habit = Habit.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:title, :description, :favourite, :start_date, :end_date, :repeat, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :user_id)
  end
end
