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
      @q.result.left_joins(:pins, :group).includes(
        :group,
        [pins: :user],
        song: %i[scores songwriter taggings]
      ).merge(Group.order(created_at: :desc)).order(created_at: :desc)
    params[:pinned] ? lessons.pinned_by(current_user) : lessons
  end

  def set_songs
    @songs =
      Song.ransack(params[:q]).result.kept.includes(pins: %i[user]).order(
        :title
      ).page(params[:page]).pinned_by(current_user).decorate
  end
end
