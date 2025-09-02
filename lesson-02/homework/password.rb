class Password
  def self.is_valid?(passwd)
    passwd.length >= 6 && passwd.length <= 10
  end
end
