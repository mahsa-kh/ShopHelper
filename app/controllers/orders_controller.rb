class OrdersController < ApplicationController
  before_action :set_shopping_list, only: [ :show, :create_order]
  def show
  end

  def mark_as_delivered
    @order = Order.find(params[:id])
    # order is done ==> order.status = false
    @order.status = false
    @order.save
    redirect_to picks_path(@order.driver)
  end

  def picks
    @orders = Order.where("driver_id = ?", params[:driver_id])

    @markers = @orders.map do |order|
      {
        lat: order.user.latitude,
        lng: order.user.longitude,
        infoWindow: render_to_string(partial: "shopping_lists/info_window", locals: { user: order.user })
      }
    end
  end

  def create_order
    #Set shopping list status: false --> The order is taken
    @shopping_list.update(status: false)
    @order = Order.new(status: true, driver: current_driver, shopping_list: @shopping_list)
    if @order.save!
      redirect_to picks_path(@order.driver)
    else
      render :picks
    end
  end

  private

  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:id])
  end
end


