class HabitSlotsController < ApplicationController
  before_action :set_habit, only: %i[create update destroy]

  # def new
  #   @habit = HabitSlot.new
  # end
end
