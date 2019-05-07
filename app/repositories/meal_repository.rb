require 'csv'

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    @next_id = 1
    load_csv
  end

  # Returns an array of instances of Meal
  def all
    @meals
  end

  # Adds meals to the repo, handling their ids, and calls #save_csv
  # to persist the meals in the meals.csv
  def add(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  private

  # Persists the repo in meals.csv file
  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv_file|
      # Meal::CSV_HEADERS is calling the nice constant that we defined in our
      # model. Check Meal to see how it was defined.
      csv_file << Meal::CSV_HEADERS
      @meals.each do |meal|
        # This is calling Meal#to_a to return an array version of a Meal
        # check it on the Meal file.
        csv_file << meal.to_a
      end
    end
  end

  # Loads csv into memory
  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # Both next line are converting the :id and :price keys to their
      # correct data objects. We want them both as integers, so we use #to_i
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    # Sets the @next_id as the last load id from the CSV
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end
end
