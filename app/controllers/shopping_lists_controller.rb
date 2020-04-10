class ShoppingListsController < ApplicationController

  before_action :find_shoppingList, only: [:show, :edit, :update]

  def new
    @shoppingList = ShoppingList.new
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


  #This method return ONLY ONE ShoppingList
  def show
  end

  def create_order
    @shoppingList = ShoppingList.find(params[:id])
    @order = Order.new(status: false)
    @order.driver = current_driver
    @order.shoppingList = @shoppingList
    # What does Order.name means? Name is applied to what?
    @order.save!
    raise
    redirect_to picks_path
  end


  # def picks
  #   @orders = Order.where("driver_id = ?", current_driver.id)
  # end

private

  def find_shoppingList
    @shoppingList = ShoppingList.find(params[:id])
    @items = Item.where("shopping_list_id = ?", params[:id])
  end


  def form_params
    params.require(:shopping_list).permit(:notes, items: [:product_name, :quantity])
  end


end
