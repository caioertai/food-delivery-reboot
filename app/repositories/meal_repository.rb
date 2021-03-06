require 'csv'

class MealRepository < BaseRepository
  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv_file|
      csv_file << Meal::CSV_HEADERS
      @elements.each do |meal|
        csv_file << meal.to_a
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @elements << Meal.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end
