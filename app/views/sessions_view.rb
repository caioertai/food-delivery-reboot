class SessionsView
  def ask_for(info)
    puts "#{info.capitalize}?"
    gets.chomp
  end
end