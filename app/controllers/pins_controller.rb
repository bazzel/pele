# frozen_string_literal: true

#:nodoc:
class PinsController < ApplicationController
  before_action :set_pin, only: %i[destroy]

  def create
    @pin = authorize current_user.pins.build(pin_params).decorate
    @pin.save!

    flash.now.notice = t('.notice', title: @pin.song.title)
    render :create_or_destroy
  end

  def destroy
    @pin.destroy!
    flash.now.notice = t('.notice', title: @pin.song.title)
    render :create_or_destroy
  end

  private

  def pin_params
    params.require(:pin).permit(:pinnable_type, :pinnable_id)
  end

  def set_pin
    @pin = authorize Pin.find(params[:id]).decorate
  end
end
