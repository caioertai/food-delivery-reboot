class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # ask the view for username
    username = @view.ask_for('username')
    # ask the view for password
    password = @view.ask_for('password')
    # ask the employee repo for the user matching the username
    employee = @employee_repository.find_by_username(username)
    # check if the password matches the user's
    if employee.password == password
      puts "Yay, you're you #{employee.username}"
      return employee
    else
      puts "Wrong credentials! Try again:"
      sign_in
    end
  end
end