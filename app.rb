# This is where we're declaring all out dependencies.
require_relative 'app/views/view'
require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'router'

# We instantiate the objects that we're gonna need!
meal_repository = MealRepository.new('data/meals.csv')
meals_controller = MealsController.new(meal_repository)

# Check the router.rb
router = Router.new(meals_controller)
router.run
