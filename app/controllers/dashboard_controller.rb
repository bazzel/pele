# frozen_string_literal: true

#:nodoc:
class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  before_action :set_pins

  def index
    @q = current_user.lessons.ransack(params[:q])
    @lessons_by_group = lessons.decorate.group_by(&:group)
    @songs = songs.decorate
  end

  private

  def lessons
    lessons = @q.result.left_joins(:pins).includes(:group, song: %i[scores])
    params[:pinned] ? lessons.merge(@pins) : lessons
  end

  def songs
    Song.ransack(params[:q]).result.joins(:pins).includes(:scores).merge(@pins)
  end

  def set_pins
    @pins = current_user.pins
  end
end
