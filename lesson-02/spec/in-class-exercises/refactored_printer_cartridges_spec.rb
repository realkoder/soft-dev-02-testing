require_relative '../../in-class-exercises/printer_cartridges'
require_relative '../../in-class-exercises/quantity_too_low_error'

RSpec.describe Order do
  describe '.calculate_discount_percentage' do
    context 'valid quantities' do
      [
        { qty: 5,   expected: 0 },
        { qty: 6,   expected: 0 },
        { qty: 99,  expected: 0 },
        { qty: 100, expected: 5 },
        { qty: 101, expected: 5 }
      ].each do |example|
        it "returns #{example[:expected]}% for quantity #{example[:qty]}" do
          expect(Order.calculate_discount_percentage(example[:qty])).to eq(example[:expected])
        end
      end
    end

    context 'invalid quantities' do
      [-1, 0, 4].each do |qty|
        it "raises QuantityTooLowError for quantity #{qty}" do
          expect { Order.calculate_discount_percentage(qty) }.to raise_error(QuantityTooLowError)
        end
      end
    end
  end
end
