class ShoppingListsController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! except: :index

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index



  def index
    @shopping_list = policy_scope(Shopping_list).reverse
  end

  def new
    @shopping_list = current_user.shopping_list.new
    authorize @shopping_list
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def set_shopping_list
    authorize @shopping_list
  end

  def shopping_list_params
  end
end
