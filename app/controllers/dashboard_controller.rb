# frozen_string_literal: true

#:nodoc:
class DashboardController < ApplicationController
  skip_after_action :verify_authorized
  def index
    @groups = current_user.groups.includes(lessons: [song: :scores]).decorate
    @songs =
      Song.joins(:pins).includes(:scores).merge(current_user.pins).decorate
  end
end
