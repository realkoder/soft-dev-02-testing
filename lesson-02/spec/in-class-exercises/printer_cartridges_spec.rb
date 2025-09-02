require_relative '../../in-class-exercises/printer_cartridges'
require_relative '../../in-class-exercises/quantity_too_low_error'

# Equivalence Partitioning & Boundary Value
# Three point boundary value problem

RSpec.describe Order do
  context 'Positive tests' do
    context 'only accepts orders quantity 5 or more' do
      it 'accepts quantity 5 and gives no discount' do
        expect(Order.calculate_discount_percentage(5)).to eq(0)
      end

      it 'accepts quantity 6 and gives no discount' do
        expect(Order.calculate_discount_percentage(6)).to eq(0)
      end
    end

    context 'provides 5% discount for quantity 100 or more' do
      it 'provides 5% discount for quantity being 100' do
        expect(Order.calculate_discount_percentage(100)).to eq(5)
      end
      it 'provides 5% discount for quantity being 101' do
        expect(Order.calculate_discount_percentage(101)).to eq(5)
      end
    end
  end

  context 'Negative tests' do
    context 'fails if quantity is below 5' do
      it 'fails if quantity is 4' do
        expect { Order.calculate_discount_percentage(4) }.to raise_error(QuantityTooLowError)
      end
    end

    context 'no discount for orders with quantity less than 100' do
      it 'discount is 0 if quantity is 99' do
        expect(Order.calculate_discount_percentage(99)).to eq(0)
      end
    end
  end
end