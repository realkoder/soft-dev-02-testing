class Airline
  def self.calculate_discount(age:, destination:, departure_day:, stay_length:)
    return 100 unless age >= 3

    discount = 0

    discount += 10 if stay_length >= 6

    return discount + 40 if age > 2 && age < 18

    return discount + 20 if destination.eql?('India') && !is_monday_or_friday(departure_day)

    return discount + 25 unless is_monday_or_friday(departure_day)

    discount
  end

  private

  def self.is_monday_or_friday(day)
    day.downcase == 'monday' || day.downcase == 'friday'
  end
end