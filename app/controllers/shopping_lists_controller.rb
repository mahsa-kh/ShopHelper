class ShoppingListsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update] # This logic overrides line 6. Need to merge line 6 logic in this line.
  before_action :authenticate_driver!, only: :index
  before_action :authenticate_driver!, only: :show, unless: :user_signed_in?
  before_action :authenticate_user!, only: :show, unless: :driver_signed_in?
  before_action :find_shoppingList, only: [:update, :show]

   def index
    @users = User.geocoded
    @shopping_lists = ShoppingList.all
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
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

  def view_all
    @shopping_lists = ShoppingList.where(user_id: current_user.id)
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

