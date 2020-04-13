class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      return true
    end

    def edit?
      return true
    end

    def show?
      return true
    end

    def update?
      return true
    end
  end
end
