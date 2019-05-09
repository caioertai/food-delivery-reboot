class Order
  ## State
  # id (Integer)
  # meal (Meal)
  # customer (Customer)
  # delivery_guy (Employee)
  # delivered (true/false)

  attr_accessor :id
  attr_reader :meal, :customer, :delivery_guy, :delivered

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @delivery_guy = attributes[:delivery_guy]
    @delivered = attributes[:delivered]
  end

  def delivered?
    @delivered
  end
end