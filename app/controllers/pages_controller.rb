class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to dashboard_path
    end
  end

  def dashboard
    @habits = Habit.where(user_id: current_user, favourite: true)
  end

  def schedule_today
    @date = Date.today
    @habitslots = HabitSlot.where(start_time: @date)
  end

  def calendar
    @habits = Habit.where(user_id: current_user)
    @habitslots = []
    @habits.each do |habit|
      habit.habit_slots.each do |habitslot|
        @habitslots << habitslot
      end
    end
  end

  def progress_page
  end

  def setting
  end
end
