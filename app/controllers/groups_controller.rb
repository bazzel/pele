# frozen_string_literal: true

#:nodoc:
class GroupsController < ApplicationController
  def index
    @groups = Group.kept.decorate
  end

  def new
    @group = Group.new.decorate
  end

  def create
    @group = Group.new(group_params).decorate

    if @group.save
      redirect_to groups_url, notice: t('.notice', name: @group.name)
    else
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:id]).decorate
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
