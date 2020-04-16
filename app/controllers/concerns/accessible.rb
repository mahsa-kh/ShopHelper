module Accessible
    extend ActiveSupport::Concern
    included do
        before_action :check_user
    end

    protected
    def check_user
        if current_driver
        flash.clear
        redirect_to(shopping_lists_path) and return
        elsif current_user
        flash.clear
        # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
        path = current_user.shopping_list ? shopping_list_path(current_user.shopping_list) : new_shopping_list_path
        redirect_to path and return
        end
    end
end