# This is where we're declaring all our dependencies.
require_relative 'app/views/meals_view'
require_relative 'app/views/customers_view'
require_relative 'app/views/sessions_view'

require_relative 'app/models/meal'
require_relative 'app/models/customer'
require_relative 'app/models/employee'

require_relative 'app/repositories/base_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'

require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'

require_relative 'router'

# We instantiate the objects that we're gonna need!
meal_repository = MealRepository.new('data/meals.csv')
customer_repository = CustomerRepository.new('data/customers.csv')
employee_repository = EmployeeRepository.new('data/employees.csv')

meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)
sessions_controller = SessionsController.new(employee_repository)

# Check the router.rb
router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
