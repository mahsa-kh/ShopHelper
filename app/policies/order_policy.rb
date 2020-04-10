class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #scope.all
      scope.where(user: user)
    end

    def new?
      return true
    end

    def create?
      return true
    end

    def show?
      return true
    end

    def update?
    record.user == user
    # - record: the order passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
    end

    def destroy?
      record.user == user
    end
  end
end
