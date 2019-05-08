require 'csv'

class EmployeeRepository < BaseRepository
  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv_file|
      csv_file << Employee::CSV_HEADERS
      @elements.each do |employee|
        csv_file << employee.to_a
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end
