require 'pry-byebug'

require_relative 'app/models/meal'
require_relative 'app/models/customer'
require_relative 'app/models/employee'
require_relative 'app/models/order'

require_relative 'app/repositories/base_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/order_repository'

# We instantiate the objects that we're gonna need!
meal_repository = MealRepository.new('data/meals.csv')
customer_repository = CustomerRepository.new('data/customers.csv')
employee_repository = EmployeeRepository.new('data/employees.csv')

order_repository = OrderRepository.new('data/orders.csv', meal_repository, employee_repository, customer_repository)


binding.pry


p order_repository

