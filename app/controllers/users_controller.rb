# frozen_string_literal: true

#:nodoc:
class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy restore]

  def index
    @users = User.kept.decorate
  end

  def new
    @user = User.new.decorate
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url, notice: t('.notice', name: @user.name)
    else
      @user = @user.decorate
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: t('.notice', name: @user.name)
    else
      render :edit
    end
  end

  def destroy
    @user.discard

    flash.now.notice = t('.notice', name: @user.name)
  end

  def restore
    @user.undiscard

    flash.now.notice = t('.notice', name: @user.name)
  end

  private

  def set_user
    @user = User.find(params[:id]).decorate
  end

  def user_params
    params.require(:user).permit(:name, :role)
  end
end
