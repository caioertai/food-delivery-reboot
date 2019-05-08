class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  # The basic method that starts the whole application
  def run
    puts "Welcome!"
    employee = @sessions_controller.sign_in
    while @running
      puts "--- / ---"

      if employee.manager?
        display_manager_options
        user_option = gets.chomp.to_i
        dispatch_manager(user_option)
      else
        puts "Employee options"
      end
    end
  end

  def display_manager_options
    puts "1. List the meals"
    puts "2. Add a meal"
    puts "3. List the customers"
    puts "4. Add a customer"
    puts "0. Exit"
  end

  def dispatch_manager(user_option)
    print `clear`
    case user_option
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then @running = false
    else
      puts "Invalid input"
    end
  end
end
