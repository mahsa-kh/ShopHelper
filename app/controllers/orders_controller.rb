class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @order = policy_scope(Order).reverse
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order.user = current_user
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

  def set_order
  end

  def order_params
  end
end
