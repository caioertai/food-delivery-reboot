class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    @running = true
  end

  # The basic method that starts the whole application
  def run
    puts "Welcome!"
    while @running
      puts "--- / ---"
      display_options
      user_option = gets.chomp.to_i
      dispatch(user_option)
    end
  end

  def display_options
    puts "1. List the meals"
    puts "2. Add a meal"
    puts "0. Exit"
  end

  def dispatch(user_option)
    print `clear`
    case user_option
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 0 then @running = false
    else
      puts "Invalid input"
    end
  end
end
