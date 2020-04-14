class ItemsController < ApplicationController
 before_action :set_shopping_list, only: [:new, :create]

  def new
    @item = Item.new
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @items = Item.where("shopping_list_id = ?", @shopping_list.id)
  end

  def create
    @new_item = Item.new(item_params)
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @new_item.shopping_list = @shopping_list
    if @new_item.save
      redirect_to new_shopping_list_item_path(@shopping_list)
    else
      @item = Item.new
      render :new
    end
  end
end



private

  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
  end


  def item_params
    params.require(:item).permit(:product_name, :quantity)
  end
