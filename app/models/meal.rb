class Meal
  CSV_HEADERS = %w[id name price]

  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def to_a
    [@id, @name, @price]
  end
end