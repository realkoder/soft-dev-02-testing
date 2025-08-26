class Calculator
  def self.sum(number1, number2)
    validate_numbers!(number1, number2)
    number1 + number2
  end

  def self.subtract(number1, number2)
    validate_numbers!(number1, number2)
    number1 - number2
  end

  def self.multiply(number1, number2)
    validate_numbers!(number1, number2)
    number1 * number2
  end

  def self.divide(number1, number2)
    validate_numbers!(number1, number2)
    raise CalculationError, 'Division by zero' if number2.zero?

    number1 / number2
  end

  private

  def self.validate_numbers!(*args)
    args.each do |arg|
      raise CalculationError, "Invalid input: #{arg.inspect} is not a number" unless arg.is_a?(Numeric)
    end
  end
end
