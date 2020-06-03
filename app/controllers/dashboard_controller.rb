# frozen_string_literal: true

#:nodoc:
class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  before_action :set_pins, :set_lessons

  def index
    @q = current_user.groups.ransack(params[:q])

    @lessons_by_group = @lessons.decorate.group_by(&:group)

    @songs = Song.joins(:pins).includes(:scores).merge(@pins).decorate
  end

  private

  def set_pins
    @pins = current_user.pins
  end

  def set_lessons
    @lessons =
      current_user.lessons.left_joins(:pins).includes(:group, song: %i[scores])
    @lessons = @lessons.merge(@pins) if params[:pinned]
  end
end
