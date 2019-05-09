class OrdersView
  def display(orders)
    orders.each do |order|
      status_text = order.delivered? ? "delivered" : "undelivered"
      # Squigly HEREDOC notations are a cool way to handle multilines
      # You're gonna learn more about them on your first day of SQL
      puts <<~STRING
        #{order.id}. #{order.meal.name} $#{order.meal.price}
           Address:     #{order.customer.address}
           Assigned to: #{order.delivery_guy.username}
           Status:      #{status_text}
      STRING
    end
  end
end