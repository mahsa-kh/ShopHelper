class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_driver!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo, :first_name, :last_name, :location])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :location])
  end

    protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
    if resource.is_a?(User)
        @shopping_list = ShoppingList.find_by(user_id: resource.id)
      if @shopping_list.nil? || @shopping_list.order.status
         return new_shopping_list_path
      else
        return shopping_list_path(@shopping_list)
      end
    end

    if resource.is_a?(Driver)
      return shopping_lists_path
    end

  end


end
