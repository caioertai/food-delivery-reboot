class Meal
  # Sets constant to be used for setting the CSV headers
  # Check  MealRepository#save_csv to see its use
  CSV_HEADERS = %w[id name price]

  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  # Makes instances of meals able to convert themselves
  # to arrays. Nice trick for doing the CSV.
  # Check  MealRepository#save_csv to see its use
  def to_a
    [@id, @name, @price]
  end
end