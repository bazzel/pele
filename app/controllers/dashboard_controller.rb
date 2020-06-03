# frozen_string_literal: true

#:nodoc:
class DashboardController < ApplicationController
  skip_after_action :verify_authorized
  def index
    @q = current_user.groups.ransack(params[:q])
    @groups = @q.result.includes(lessons: [song: :scores]).decorate

    @songs =
      Song.joins(:pins).includes(:scores).merge(current_user.pins).decorate
  end
end
