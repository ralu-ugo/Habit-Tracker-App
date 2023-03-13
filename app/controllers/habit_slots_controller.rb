class HabitSlotsController < ApplicationController
  before_action :set_habit, only: %i[show new create edit update]

  def show
    @habitslot = HabitSlot.find(params[:id])
  end

  def new
    @habitslot = HabitSlot.new
  end

  def create
    @habitslot = HabitSlot.new(habitslot_params)
    @habitslot.habit = @habit
    if @habitslot.save
      redirect_to habit_habit_slot_path(@habit, @habitslot)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @habitslot = HabitSlot.find(params[:id])
  end

  def update
    @habitslot = HabitSlot.find(params[:id])
    respond_to do |format|
      if @habitslot.update(habitslot_params)
        puts request.format
        format.json
        format.html { redirect_to habit_habit_slot_path(@habit, @habitslot) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json
      end
    end
  end

  def destroy
    @habitslot = HabitSlot.find(params[:id])
    @habitslot.destroy
    redirect_to habits_path, status: :see_other
  end

  private

  def set_habit
    @habit = Habit.find(params[:habit_id])
  end

  def habitslot_params
    params.require(:habit_slot).permit(:start_time, :completed)
  end
end
