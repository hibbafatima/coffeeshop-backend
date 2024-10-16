class OrdersController < ApplicationController
  def show
    @order = Order.includes(order_items: :item).find(params[:id])
    render json: @order, include: { order_items: { include: :item } }
  end

  def new
    @order = Order.new
    @items = Item.all
  end

  def create
    @order = Order.new({user_id: order_params[:user_id]})
    if order_params[:order_items].present?
      order_params[:order_items].each do |item|
         selected_item = Item.find(item[:item_id])
        @order.order_items.build(
          item: selected_item,
          quantity: item[:quantity], #default quantity set to 1 later update to handle dynamic user given quantities
          price: selected_item.price,
          tax_rate: calculate_tax_rate(selected_item)          
        )
      end
    end

    if @order.save
      render json: @order
    else
      redirect_to root_path, alert: "Failed to place the order. Please try again."
    end
  end

  def send_notification
    order = Order.find(params[:id])
    SendNotificationJob.set(wait: 2.minutes).perform_later(order)

    render json: { message: 'Payment processed and notification scheduled.' }, status: :ok
  end

  private
  
  def order_params
    params.require(:orders).permit(:user_id, order_items: [:item_id, :quantity])
  end

  def calculate_tax_rate(item)
    user = User.find(order_params[:user_id])    
    item_tax_category = ItemTaxCategory.find_by(item_id: item.id, location_id: user.location_id)
    
    # If there is no tax category found for the item and location, coffee shop is in tax-free zone so return 0
    return 0 unless item_tax_category

    item_tax_category.tax_rate
  end
end
