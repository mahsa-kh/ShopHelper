class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]

  def index
    @shopping_lists = Shopping_list.all?
  end

  def new
    @shopping_list = Shopping_list.new
  end

  def create
    @shopping_list = Shopping_list.new(shopping_list_params)
    @shopping_list.user = current_user

    if shopping_list.save
      redirect_to @shopping_list, notice: "the shopping list was successfully created"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shopping_list.update(shopping_list_params)
      redirect_to @shopping_list, notice: "Shopping list was successfully update"
    else
      render :new
    end
  end

  def destroy
    @shopping_list.destroy
    redirect_to shopping_list_url, notice: "the shopping list was successfully destroyed"
  end


  private

  def set_shopping_list
    @shopping_list = Shopping_list.find(params[:id])
  end

  def shoppig_list_params
    params.require(:shopping_list).permit(:name)
  end
end
