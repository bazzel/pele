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
end
