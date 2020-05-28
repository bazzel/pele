# frozen_string_literal: true

#:nodoc:
class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update destroy restore]

  def index
    @groups = Group.kept.decorate
  end

  def new
    @group = Group.new.decorate
  end

  def edit; end

  def create
    @group = Group.new(group_params).decorate
    @group.teacher = current_user

    if @group.save
      redirect_to groups_url, notice: t('.notice', name: @group.name)
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_url, notice: t('.notice', name: @group.name)
    else
      render :edit
    end
  end

  def destroy
    @group.discard

    flash.now.notice = t('.notice', name: @group.name)
  end

  def restore
    @group.undiscard

    flash.now.notice = t('.notice', name: @group.name)
  end

  private

  def set_group
    @group = Group.find(params[:id]).decorate
  end

  def group_params
    params.require(:group).permit(:name, :student_ids, :teacher_id)
  end
end
