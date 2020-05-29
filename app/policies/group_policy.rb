# frozen_string_literal: true

#:nodoc:
class GroupPolicy < ApplicationPolicy
  #:nodoc:
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.teacher?
  end

  def create?
    user.teacher?
  end

  def update?
    record.teacher == user
  end

  def destroy?
    update?
  end

  def restore?
    destroy?
  end
end
