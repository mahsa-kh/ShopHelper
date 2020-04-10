class ShoppingListsController < ApplicationController

  before_action :find_shoppingList, only: [:show, :edit, :update]

  def new
    @shoppingList = ShoppingList.new
    @items = Item.new
  end

  def create
    @shoppingList = ShoppingList.new(status: true)
    # @shoppingList.user = current_user
    @shoppingList.user = User.find(6)

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


  #This method returns ONLY ONE ShoppingList
  def show
  end

  def create_order
    @shoppingList = ShoppingList.find(params[:id])
    @order = Order.new(status: true)
    @order.driver = current_driver
    @order.shopping_list = @shoppingList
    if @order.save!
      redirect_to picks_path(@order.driver_id)
    else
      render :show
    end
  end


  def picks
    @orders = Order.where("driver_id = ?", params[:driver_id])
  end

  def delivered?
    @order.status = false;
    @order.shopping_list.status = false;
    redirect_to picks_path(@order.driver_id)
  end

private

  def find_shoppingList
    @shoppingList = ShoppingList.find(params[:id])
    @items = Item.where("shopping_list_id = ?", params[:id])
  end


  def form_params
    params.require(:shopping_list).permit(:notes, items: [:product_name, :quantity])
  end


end
