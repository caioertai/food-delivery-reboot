class CustomersView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name} - #{customer.address}"
    end
  end

  def ask_for(info)
    puts "#{info.capitalize}?"
    gets.chomp
  end
end
