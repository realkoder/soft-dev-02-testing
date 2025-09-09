class User
  attr_accessor :firstname, :lastname, :email
  attr_reader :emailer

  def initialize(firstname, lastname, email, emailer)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @emailer = emailer
  end

  def send_email
    emailer.send_email("Hello #{@firstname}")
  end
end
