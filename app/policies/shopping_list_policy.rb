class ShoppingListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new?
      return true
    end

    def create?
      return true
    end

    def edit?
      return true
    end

    def destroy?
      return true
    end

    def update?
      return true
    end
  end
end