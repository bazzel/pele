# frozen_string_literal: true

#:nodoc:
class SongsController < ApplicationController
  before_action :set_song, only: %i[edit update destroy restore]

  skip_after_action :verify_authorized, only: :index

  def index
    @q = Song.ransack(params[:q])
    @songs =
      @q.result.kept.includes(:scores, :songwriter, :taggings).order(:title)

    @songs = @songs.pinned_by(current_user) if params[:pinned]
    @songs = @songs.decorate
  end

  def new
    @song = authorize Song.new.decorate
    @song.scores.build
  end

  def edit
    @song.scores.build if @song.scores.none?
  end

  def create
    @song = authorize Song.new(song_params)

    if @song.save
      redirect_to songs_url, notice: t('.notice', title: @song.title)
    else
      @song = @song.decorate
      @song.scores.build if @song.scores.none?
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to songs_url, notice: t('.notice', title: @song.title)
    else
      @song.scores.build if @song.scores.none?
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
    @song = authorize Song.find(params[:id]).decorate
  end

  def song_params
    params.require(:song).permit(
      :title,
      :songwriter_id,
      :songwriter_title,
      :tag_list,
      scores_attributes: %i[
        id
        attachment
        attachment_cache
        tablature_notation
        _destroy
      ]
    )
  end
end
