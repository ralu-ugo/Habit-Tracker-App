class DailyTracksController < ApplicationController
  before_action :set_daily_track, only: %i[edit update destroy]
  def new
    @daily_track = DailyTrack.new
  end

  def create
    @daily_track = DailyTrack.new(daily_track_params)
    # @daily_track.user_id = current_user.id
    if @daily_track.save
      redirect_to daily_track_path(@daily_track)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @daily_track.update(params[daily_track_params])
      redirect_to daily_track_path(@daily_track)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @daily_track.destroy
    redirect_to daily_track_path, status: :see_other
  end

  private

  def set_daily_track
    @daily_track = DailyTrack.find(params[:daily_track_id])
  end

  def daily_tracks_params
    params.require(:daily_track).permit(:habit_id, :completed, :completion_date)
  end
end
