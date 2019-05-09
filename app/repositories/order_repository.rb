class OrderRepository < BaseRepository
  def initialize(csv_file_path, meal_repository, employee_repository, customer_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository

    @csv_file_path = csv_file_path
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  # We named this #undelivered, but your rake will ask for it to be #undelivered_orders
  def undelivered
    @elements.reject { |element| element.delivered? }
  end

  # Read the comment above
  def undelivered_for(delivery_guy)
    undelivered.select { |element| element.delivery_guy == delivery_guy }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # We have only strings of ids stored inside the CSV, but we need to
      # load in memory Order instances that have actual Meal, Customer and Employee
      # instances inside them. The next 3 line are going to take care of that.

      # We ask for the meal repository to find the meal with the id we have
      # We save it on the key :meal of the row (which, remembers, behaves like a hash)
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)

      # We ask for the customer repository to find the customer with the id we have
      # We save it on the key :customer of the row (which, remembers, behaves like a hash)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)

      # We ask for the employee repository to find the employee with the id we have
      # We save it on the key :employee of the row (which, remembers, behaves like a hash)
      row[:delivery_guy] = @employee_repository.find(row[:delivery_guy_id].to_i)

      # Converts the text id on row to an integer
      row[:id] = row[:id].to_i

      # Converts the boolean text on delivered to an actual boolean
      row[:delivered] = row[:delivered] == "true"

      # Instantiates a new Order and stores it in the @elements array
      @elements << Order.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end