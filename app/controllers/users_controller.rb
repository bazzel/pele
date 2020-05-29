# frozen_string_literal: true

#:nodoc:
class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy restore]

  def index
    authorize User
    @users = User.kept.decorate
  end

  def new
    @user = authorize User.new.decorate
  end

  def edit; end

  def create
    @user = authorize User.new(user_params).decorate

    if @user.save
      redirect_to users_url, notice: t('.notice', name: @user.to_label)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: t('.notice', name: @user.to_label)
    else
      render :edit
    end
  end

  def destroy
    @user.discard

    flash.now.notice = t('.notice', name: @user.to_label)
  end

  def restore
    @user.undiscard

    flash.now.notice = t('.notice', name: @user.to_label)
  end

  private

  def set_user
    @user = authorize User.find(params[:id]).decorate
  end

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end
