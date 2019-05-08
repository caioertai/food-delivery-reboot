class Customer
  CSV_HEADERS = %w[id name address]

  attr_accessor :id
  attr_reader :name, :address

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def to_a
    [@id, @name, @address]
  end
end