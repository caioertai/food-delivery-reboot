class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    # Ask the repo for the customers
    customers = @customer_repository.all
    # Ask view to display
    @view.display(customers)
  end

  def add
    # Ask the view for the name
    name = @view.ask_for("name")
    # Ask the view for the address
    address = @view.ask_for("address")
    # Instantiate a new customer
    customer = Customer.new(name: name, address: address)
    # Ask the repo to add the customer
    @customer_repository.add(customer)
  end
end