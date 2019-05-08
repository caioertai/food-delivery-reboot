class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} - R$#{meal.price}"
    end
  end

  def ask_for_name
    puts "What's the meal's name?"
    gets.chomp
  end

  def ask_for_price
    puts "What's the meal's price?"
    gets.chomp.to_i
  end
end
