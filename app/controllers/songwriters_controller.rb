# frozen_string_literal: true

#:nodoc:
class SongwritersController < ApplicationController
  skip_after_action :verify_authorized, only: :index

  def index
    @q = Songwriter.ransack(params[:q])
    @songwriters = @q.result.order(:name).decorate
  end
end
