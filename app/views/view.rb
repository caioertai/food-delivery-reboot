# Our dumb dumb view only knows how to do what it's told by the controller =)
class View
  # Lists the meals. Currently used in MealsController#list
  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} - R$#{meal.price}"
    end
  end

  # Asks for a name. Currently used in MealsController#add
  def ask_for_name
    puts "What's the meal's name?"
    gets.chomp
  end

  # Asks for a price and converts it to integer. Currently used in MealsController#add
  def ask_for_price
    puts "What's the meal's price?"
    gets.chomp.to_i
  end
end
