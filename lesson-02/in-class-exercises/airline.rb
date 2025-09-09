class Airline
  def self.calculate_discount(age:, destination:, departure_day:, stay_length:)
    return 100 if age < 3

    discount = 0
    discount += 10 if stay_length >= 6

    if age < 18
      discount += 40
    elsif destination.eql?("India") && !monday_or_friday?(departure_day)
      discount += 20
    elsif !monday_or_friday?(departure_day)
      discount += 25
    end

    discount
  end

  private

  def self.monday_or_friday?(day)
    %w[monday friday].include?(day.downcase)
  end
end
