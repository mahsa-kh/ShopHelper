class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = policy_scope(Order).order(created_at: :desc)
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    authorize @order

    if order.save
      redirect_to @order, notice: "the order was successfully created"
    else
      render :new
    end
  end

  def show
    authorize @order
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was successfully update"
    else
      render :new
    end
  end

  def destroy
    @order.destroy
    redirect_to order_url, notice: "the order was successfully destroyed"
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name)
  end
end
