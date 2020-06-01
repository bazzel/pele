class PinPolicy < ApplicationPolicy
  def create?
    user.student? && (record.nil? || record.new_record?)
  end

  def destroy?
    user.student? && record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
