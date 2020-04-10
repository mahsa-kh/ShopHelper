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
    @shoppingList = ShoppingList.new(status: true)
    @shoppingList.user = current_user

    if @shoppingList.save!
      redirect_to edit_shopping_list_path(@shoppingList)
    else
      render :new
    end
  end

  def edit
    @item = Item.new
  end


  def update
    @new_item = Item.new(form_params[:items])
    @shoppingList.notes = form_params[:notes]
    @new_item.shopping_list = @shoppingList

    if @new_item.save!
      @items = Item.where("shopping_list_id = ?", params[:id])
      redirect_to edit_shopping_list_path(@shoppingList)
    else
      render :new
    end
  end

  def show
  end


private

  def find_shoppingList
    @shoppingList = ShoppingList.find(params[:id])
    @items = Item.where("shopping_list_id = ?", params[:id])
    authorize @shopping_list

  end


  def form_params
    params.require(:shopping_list).permit(:notes, items: [:product_name, :quantity])
  end
end
