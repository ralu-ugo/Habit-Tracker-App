class HabitsController < ApplicationController
  before_action :find_habit, only: %i[show edit update destroy]

  def index
    @habits = Habit.where(user_id: current_user)
    @habitslots = []
    @habits.each do |habit|
      habit.habit_slots.each do |habitslot|
        @habitslots << habitslot
      end
    end
  end

  def show
    @habit = Habit.find(params[:id])
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.create(habit_params)
    @habit.user_id = current_user.id
    if @habit.repeat == true
      if @habit.everyday == true
        @habit.monday = true
        @habit.tuesday = true
        @habit.wednesday = true
        @habit.thursday = true
        @habit.friday = true
        @habit.saturday = true
        @habit.sunday = true
      end
    elsif @habit.repeat == false
      if @habit.monday == true
        @habit.tuesday = false
        @habit.wednesday = false
        @habit.thursday = false
        @habit.friday = false
        @habit.saturday = false
        @habit.sunday = false
      end
      if @habit.tuesday == true
        @habit.monday = false
        @habit.wednesday = false
        @habit.thursday = false
        @habit.friday = false
        @habit.saturday = false
        @habit.sunday = false
      end
      if @habit.wednesday == true
        @habit.monday = false
        @habit.tuesday = false
        @habit.thursday = false
        @habit.friday = false
        @habit.saturday = false
        @habit.sunday = false
      end
      if @habit.thursday == true
        @habit.monday && @habit.tuesday && @habit.wednesday && @habit.friday && @habit.saturday && @habit.sunday = false
      end
      if @habit.friday == true
        @habit.monday && @habit.tuesday && @habit.wednesday && @habit.thursday && @habit.saturday && @habit.sunday = false
      end
      if @habit.saturday == true
        @habit.monday && @habit.tuesday && @habit.wednesday && @habit.thursday && @habit.friday && @habit.sunday = false
      end
      if @habit.sunday == true
        @habit.monday && @habit.tuesday && @habit.wednesday && @habit.thursday && @habit.friday && @habit.saturday = false
      end
    end
    @habit.save!
    if @habit.save
      redirect_to habits_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @habit.update(habit_params)
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
    params.require(:habit).permit(
      :title,
      :description,
      :favourite,
      :start_date,
      :end_date,
      :repeat,
      :everyday,
      :monday,
      :tuesday,
      :wednesday,
      :thursday,
      :friday,
      :saturday,
      :sunday,
      :user_id
    )
  end
end
