require_relative '../../../app/roman_numeral'

RSpec.describe RomanNumeral do
  context 'positive testings' do
    context '#convert_number_to_roman' do
    it 'converts 1 to I' do
      expect(RomanNumeral.convert_number_to_roman(1)).to eq("I")
    end
      it 'converts 4 to IV' do
        expect(RomanNumeral.convert_number_to_roman(4)).to eq("IV")
      end

      it 'converts 10 to X' do
        expect(RomanNumeral.convert_number_to_roman(10)).to eq("X")
      end

      it 'converts 10 to X' do
        expect(RomanNumeral.convert_number_to_roman(10)).to eq("X")
      end

      it 'converts 18 to XVIII' do
        expect(RomanNumeral.convert_number_to_roman(18)).to eq("XVIII")
      end

      it 'converts 20 to XX' do
        expect(RomanNumeral.convert_number_to_roman(20)).to eq("XX")
      end

      it 'converts 3999 to MMMCMXCIX' do
        expect(RomanNumeral.convert_number_to_roman(3999)).to eq("MMMCMXCIX")
      end
    end
  end

  context 'negative testings' do
    it 'returns "" when 0 or less is parsed' do
      expect(RomanNumeral.convert_number_to_roman(0)).to eq("")
      expect(RomanNumeral.convert_number_to_roman(-10)).to eq("")
    end

    it 'returns "" when 4000 or more is parsed' do
      expect(RomanNumeral.convert_number_to_roman(4000)).to eq("")
      expect(RomanNumeral.convert_number_to_roman(99999)).to eq("")
    end
  end
end