class Order
  def self.calculate_discount_percentage(quantity)
    raise QuantityTooLowError, "Quantity: #{quantity} is too low" unless quantity >= 5

    return 5 if quantity >= 100

    0
  end
end