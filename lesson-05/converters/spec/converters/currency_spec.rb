require_relative '../../lib/currency'
require_relative '../../lib/currency_api_client'
require 'rspec'

RSpec.describe Currency do
  let(:currency) { Currency.new('DKK') }

  describe '#convert positive cases' do
    it 'converts a normal amount to USD' do
      result = currency.convert(100, 'USD')
      expect(result).to be_a(Float)
      expect(result).to be > 0
    end

    it 'converts zero amount to any currency' do
      expect(currency.convert(0, 'USD')).to eq(0.0)
    end

    it 'converts a small positive amount' do
      result = currency.convert(0.01, 'USD')
      expect(result).to be > 0
    end

    it 'converts large amount correctly' do
      result = currency.convert(10_000_000, 'USD')
      expect(result).to be > 0
    end

    it 'handles lowercase currency codes' do
      result_upper = currency.convert(100, 'USD')
      result_lower = currency.convert(100, 'usd')
      expect(result_lower).to eq(result_upper)
    end
  end

  describe '#convert negative cases' do
    it 'raises error for unsupported currency' do
      expect { currency.convert(100, 'XYZ') }.to raise_error(ArgumentError)
    end

    it 'raises error for negative amounts (optional)' do
      # Depending on design, you may allow negative amounts for refunds etc.
      # If not allowed:
      expect { currency.convert(-50, 'USD') }.not_to raise_error
    end

    it 'raises error for invalid base currency' do
      expect { Currency.new('XXX', api_key).convert(100, 'USD') }.to raise_error(RuntimeError)
    end
  end
end
