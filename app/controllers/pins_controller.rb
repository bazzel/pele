# frozen_string_literal: true

#:nodoc:
class PinsController < ApplicationController
  before_action :set_pin, only: %i[destroy]

  def create
    pin = authorize current_user.pins.build(pin_params)

    pin.save!
    @song = pin.pinnable.decorate
    flash.now.notice = t('.notice', title: @song.title)
    render :create_or_destroy
  end

  def destroy
    @song = @pin.pinnable.decorate

    @pin.destroy!
    flash.now.notice = t('.notice', title: @song.title)
    render :create_or_destroy
  end

  private

  def pin_params
    params.require(:pin).permit(:pinnable_type, :pinnable_id)
  end

  def set_pin
    @pin = authorize Pin.find(params[:id])
  end
end
