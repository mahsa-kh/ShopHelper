class ShoppingListsController < ApplicationController
  before_action :find_shoppingList, only: [:update, :show, :destroy]
  before_action do |controller|
    if ['new', 'create', 'update'].include? controller.action_name 
      authenticate_user!
    elsif controller.action_name == 'show'
      if !user_signed_in? && !driver_signed_in?
        authenticate_user!
      end
    elsif controller.action_name == 'index'
      authenticate_driver!
    end
  end

   def index
    @users = User.geocoded
    # @shopping_lists = ShoppingList.all
   @shopping_lists = []

   @users.each do |user|
     if user.shopping_list != nil && user.shopping_list.status != false
       @shopping_lists << user.shopping_list
     end
   end
    @markers = @shopping_lists.map do |shopping_list|
      {
        lat: shopping_list.user.latitude,
        lng: shopping_list.user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: shopping_list.user }),
        picture: helpers.asset_url("sb.png")
      }
    end
  end


  def new
    @shopping_list = ShoppingList.new
    @items = Item.new
  end

  def create
    @shopping_list = ShoppingList.new(status: true, user: current_user)

    if @shopping_list.save!
      redirect_to new_shopping_list_item_path(@shopping_list)
    else
      render :new
    end
  end


  def update
    @shopping_list.update(notes: form_params)
    redirect_to shopping_list_path(@shopping_list)
  end


  #This method returns ONLY ONE ShoppingList
  def show
  end

  def destroy
    @shopping_list.destroy
    redirect_to  view_all_path(current_user)
  end

  def view_all
    @shopping_lists = ShoppingList.where(user_id: 6)
    # @shopping_lists = ShoppingList.where(user_id: current_user.id)
  end



private

  def find_shoppingList
    @shopping_list = ShoppingList.find(params[:id])
    @items = Item.where("shopping_list_id = ?", params[:id])
  end


  def form_params
    params.require(:shopping_list).permit(:notes)
  end

end

