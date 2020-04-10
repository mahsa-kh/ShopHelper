class ShoppingListsController < ApplicationController

  before_action :find_shoppingList, only: [:show, :edit, :update]

  def new
    @shopping_list = ShoppingList.new
    @items = Item.new
  end

  def create
    @shopping_list = ShoppingList.new(status: true, user: current_user)

    if @shopping_list.save!
      redirect_to edit_shopping_list_path(@shopping_list)
    else
      render :new
    end
  end

  def edit
    @item = Item.new
  end


  def update
    @new_item = Item.new(form_params[:items])
    @shopping_list.update(notes: form_params[:notes])
    @new_item.shopping_list = @shopping_list

    if @new_item.save!
      @items = Item.where("shopping_list_id = ?", params[:id])
      redirect_to edit_shopping_list_path(@shopping_list)
    else
      render :new
    end
  end


  #This method returns ONLY ONE ShoppingList
  def show
  end


private

  def find_shoppingList
    @shopping_list = ShoppingList.find(params[:id])
    @items = Item.where("shopping_list_id = ?", params[:id])
  end


  def form_params
    params.require(:shopping_list).permit(:notes, items: [:product_name, :quantity])
  end


end
