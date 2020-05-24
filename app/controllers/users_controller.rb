class UsersController < ApplicationController
  def index
    @users = User.kept.decorate
  end

  def new
    @user = User.new.decorate
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url, notice: t('.notice', name: @user.name)
    else
      @user = @user.decorate
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id]).decorate
  end

  def user_params
    params.require(:user).permit(:name, :role)
  end
end
