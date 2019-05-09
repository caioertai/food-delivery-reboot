class OrdersController
  def initialize(order_repository)
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def list_undelivered(delivery_guy = nil)
    orders = if delivery_guy.nil?
               @order_repository.undelivered
             else
               @order_repository.undelivered_for(delivery_guy)
             end
    @view.display(orders)
  end

  def add
    # TODO: Your call. It will involve reusing a bunch of things we already have ready.
    # Show the meals
    # Get the user option
    # Ask the meal repo for the meal (add meal repo to the controller initialize)
    # Show the customers
    # Get the user option
    # Ask the customer repo for the customer (same as above)
    # Show the delivery_guys
    # Get the user option
    # Ask the delivery_guy repo for the delivery_guy (same as above)
    # Instantiate the order with the info that we got
    # Ask the orders repo to add this order to itself
  end
end