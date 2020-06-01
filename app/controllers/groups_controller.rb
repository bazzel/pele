# frozen_string_literal: true

#:nodoc:
class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update destroy restore]

  def index
    authorize Group
    @groups = policy_scope(Group).kept.decorate
  end

  def new
    @group = authorize Group.new.decorate
    @group.lessons.build
  end

  def edit
    @group.lessons.build if @group.lessons.none?
  end

  def create
    @group = authorize Group.new(group_params).decorate

    if @group.save
      redirect_to groups_url, notice: t('.notice', name: @group.name)
    else
      @group.lessons.build if @group.lessons.none?
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_url, notice: t('.notice', name: @group.name)
    else
      @group.lessons.build if @group.lessons.none?
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
    @group = authorize Group.find(params[:id]).decorate
  end

  def group_params
    params.require(:group).permit(
      :name,
      :student_ids,
      :teacher_id,
      lessons_attributes: %i[id song_id song_title _destroy]
    ).merge(teacher: current_user)
  end
end
