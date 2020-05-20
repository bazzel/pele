# frozen_string_literal: true

#:nodoc:
class SongsController < ApplicationController
  before_action :set_song, only: %i[edit update destroy restore]

  def index
    @songs = Song.kept.order(:title).decorate
  end

  def new
    @song = Song.new.decorate
  end

  def edit; end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to songs_url, notice: t('.notice', title: @song.title)
    else
      @song = @song.decorate
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to songs_url, notice: t('.notice', title: @song.title)
    else
      render :edit
    end
  end

  def destroy
    @song.discard

    flash.now.notice = t('.notice', title: @song.title)
  end

  def restore
    @song.undiscard

    flash.now.notice = t('.notice', title: @song.title)
  end

  private

  def set_song
    @song = Song.find(params[:id]).decorate
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
