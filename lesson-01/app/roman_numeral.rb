class RomanNumeral

  ROMAN_NUMERALS = [
    { sign: 'I', value: 1 },
    { sign: 'IV', value: 4 },
    { sign: 'V', value: 5 },
    { sign: 'IX', value: 9 },
    { sign: 'X', value: 10 },
    { sign: 'XL', value: 40 },
    { sign: 'L', value: 50 },
    { sign: 'XC', value: 90 },
    { sign: 'C', value: 100 },
    { sign: 'CD', value: 400 },
    { sign: 'D', value: 500 },
    { sign: 'CM', value: 900 },
    { sign: 'M', value: 1000 }
  ].freeze

  def self.convert_number_to_roman(number)
    return '' if number <= 0
    return '' if number > 3999

    roman_number = ''
    converting_number = number

    ROMAN_NUMERALS.reverse.each do |roman|
      amount_of_letters = converting_number / roman[:value]
      if amount_of_letters > 0
        amount_of_letters.times do
          roman_number << roman[:sign]
        end
        converting_number %= roman[:value]
      end
    end

    roman_number
  end
end
