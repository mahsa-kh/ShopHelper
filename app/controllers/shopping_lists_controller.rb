class ShoppingListsController < ApplicationController
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  before_action :find_shoppingList, only: [:show, :edit, :update]

  def index
    @shopping_list = policy_scope(Shopping_list).reverse
  end

  def new
    @shoppingList = ShoppingList.new
    authorize @shopping_list
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
  end


private

  def find_shoppingList
    @shopping_list = ShoppingList.find(params[:id])
    @items = Item.where("shopping_list_id = ?", params[:id])
    authorize @shopping_list

  end


  def form_params
    params.require(:shopping_list).permit(:notes)
  end
end
