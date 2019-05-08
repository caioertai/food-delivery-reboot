require 'csv'

class CustomerRepository < BaseRepository
  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv_file|
      csv_file << Customer::CSV_HEADERS
      @elements.each do |customer|
        csv_file << customer.to_a
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << Customer.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end
