# frozen_string_literal: true

#:nodoc:
class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  before_action :set_pins

  def index
    @q = current_user.lessons.ransack(params[:q])
    @lessons = @q.result.left_joins(:pins).includes(:group, song: %i[scores])
    @lessons = @lessons.merge(@pins) if params[:pinned]

    @lessons_by_group = @lessons.decorate.group_by(&:group)

    @songs =
      Song.ransack(params[:q]).result.joins(:pins).includes(:scores).merge(
        @pins
      ).decorate
  end

  private

  def set_pins
    @pins = current_user.pins
  end
end
