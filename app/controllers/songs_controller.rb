# frozen_string_literal: true

#:nodoc:
class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new.decorate
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to songs_url, notice: t('.notice', title: @song.title)
    else
      @song = @song.decorate
      render :new
    end
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
