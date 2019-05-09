class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    puts "Welcome!"
    @employee = @sessions_controller.sign_in
    while @running
      puts "--- / ---"

      if @employee.manager?
        display_manager_options
        user_option = gets.chomp.to_i
        print `clear`
        dispatch_manager(user_option)
      else
        display_delivery_guy_options
        user_option = gets.chomp.to_i
        print `clear`
        dispatch_delivery_guy(user_option)
      end
    end
  end

  private

  def display_manager_options
    puts "1. List the meals"
    puts "2. Add a meal"
    puts "3. List the customers"
    puts "4. Add a customer"
    puts "5. List all undelivered orders"
    puts "0. Exit"
  end

  def display_delivery_guy_options
    puts "1. List all undelivered orders assigned to me"
    puts "0. Exit"
  end

  def dispatch_delivery_guy(user_option)
    case user_option
    when 1 then @orders_controller.list_undelivered(@employee)
    when 0 then @running = false
    else
      puts "Invalid input"
    end
  end

  def dispatch_manager(user_option)
    case user_option
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered
    when 0 then @running = false
    else
      puts "Invalid input"
    end
  end
end
