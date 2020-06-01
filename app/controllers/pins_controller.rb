class PinsController < ApplicationController
  before_action :set_song, only: %i[create]
  before_action :set_pin, only: %i[destroy]

  def create
    pin = authorize current_user.pins.build(song: @song)

    if pin.save
      flash.now.notice = t('.notice', title: @song.title)
      render :create_or_destroy
    end
  end

  def destroy
    @song = @pin.song.decorate

    if @pin.destroy
      flash.now.notice = t('.notice', title: @song.title)
      render :create_or_destroy
    end
  end

  private

  def set_song
    @song = Song.find(params[:song_id]).decorate
  end

  def set_pin
    @pin = authorize Pin.find(params[:id])
  end
end
