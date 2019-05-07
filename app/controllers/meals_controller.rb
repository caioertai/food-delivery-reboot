class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = View.new
  end

  def list
    # Ask the repo for the meals
    meals = @meal_repository.all
    # Ask the view to display the meals
    @view.display_meals(meals)
  end

  def add
    # Ask the view for the name
    name = @view.ask_for_name
    # Ask the view for the price
    price = @view.ask_for_price
    # Create a new meal instance
    meal = Meal.new(name: name, price: price)
    # Ask the repo to save this meal
    @meal_repository.add(meal)
  end
end