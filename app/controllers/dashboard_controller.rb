# frozen_string_literal: true

#:nodoc:
class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @q = current_user.lessons.ransack(params[:q])
    set_lessons_by_group
    set_songs
  end

  private

  def set_lessons_by_group
    @lessons_by_group = lessons.decorate.group_by(&:group)
  end

  def lessons
    lessons =
      @q.result.left_joins(:pins).includes(
        :group,
        :pins,
        song: %i[scores songwriter taggings]
      )
    params[:pinned] ? lessons.pinned_by(current_user) : lessons
  end

  def set_songs
    @songs =
      Song.ransack(params[:q]).result.kept.includes(
        :scores,
        :songwriter,
        :taggings,
        :pins
      ).order(:title).pinned_by(current_user).decorate
  end
end
