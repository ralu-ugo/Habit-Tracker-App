class HabitsController < ApplicationController
  before_action :find_habit, only: %i[show edit update destroy favourite]

  def index
    if params[:query].present?
      @habits = Habit.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @habits = Habit.where(user_id: current_user)
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
        @habit.monday && @habit.tuesday && @habit.wednesday && @habit.thursday && @habit.friday && @habit.saturday && @habit.sunday = true
      end
    elsif @habit.repeat == false
      if @habit.monday == true
        @habit.tuesday && @habit.wednesday && @habit.thursday && @habit.friday && @habit.saturday && @habit.sunday = false
      end
      if @habit.tuesday == true
        @habit.monday && @habit.wednesday && @habit.thursday && @habit.friday && @habit.saturday && @habit.sunday = false
      end
      if @habit.wednesday == true
        @habit.monday && @habit.tuesday && @habit.thursday && @habit.friday && @habit.saturday && @habit.sunday = false
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

  def favourite
    if @habit.set_favourite(params[:favourite]).save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @habitslot = HabitSlot.find(params[:id])
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
      :user_id,
      :colour
    )
  end
end
