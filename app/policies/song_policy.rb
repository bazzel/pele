# frozen_string_literal: true

#:nodoc:
class SongPolicy < ApplicationPolicy
  #:nodoc:
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.teacher?
  end

  def update?
    user.teacher?
  end

  def destroy?
    update?
  end

  def restore?
    destroy?
  end

  def permitted_attributes
    [
      :title,
      :songwriter_id,
      :songwriter_title,
      :tag_list,
      scores_attributes: scores_attributes
    ]
  end

  private

  def scores_attributes
    %i[id attachment attachment_cache tablature_notation _destroy]
  end
end
