# frozen_string_literal: true

#:nodoc:
class UserPolicy < ApplicationPolicy
  #:nodoc:
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin? || user.teacher?
  end

  def create?
    user.admin? || user.teacher?
  end

  def update?
    user.admin? || user.teacher?
  end

  def destroy?
    update?
  end

  def restore?
    destroy?
  end
end
