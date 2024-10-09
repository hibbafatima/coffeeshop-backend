class OrdersController < ApplicationController

  def show
    @order = Order.includes(:order_items).find(params[:id]) #eager loading associated order items for order
  end

  def new
    @order = Order.new
    @items = Item.all
  end

  def create
    @order = Order.new(order_params)
    # Build associated order items for the selected item Ids
    if params[:order][:item_ids].present?
      params[:order][:item_ids].each do |item_id|
        item = Item.find(item_id)
        @order.order_items.build(
          item: item,
          quantity: 1, #default quantity set to 1 later update to handle dynamic user given quantities
          price: item.price,
          tax_rate: calculate_tax_rate(item)
        )
      end
    end
    
    if @order.save
      redirect_to @order, notice: "Order placed successfully!"
    else
      render :new
    end
  end

  private
  
  def order_params
    byebug
    params.require(:orders).permit(:customer_id, items: [:id, :name, :price])
  end

  def calculate_tax_rate(item)
    5 #dummy logic for testing purpose
    #TODO build tax calculation logic here
  end
end
