require_relative '../../homework/e_shop'

RSpec.describe EShop do
  # Valid equivalence partition for amount: 0.00 - 299.99, 300.00 - 799.99, 800.00 >
  context 'positive tests' do
    [
      # Valid amount boundaries for 0% discount
      { amount: 0.00, expected: 0 }, # Valid lower boundary
      { amount: 0.01, expected: 0 },
      { amount: 150.00, expected: 0 }, # Valid middle boundary
      { amount: 299.98, expected: 0 },
      { amount: 299.99, expected: 0 }, # Valid upper boundary

      # Valid amount boundaries for 5% discount
      { amount: 300.00, expected: 5 }, # Valid lower boundary
      { amount: 300.01, expected: 5 },
      { amount: 550.00, expected: 5 }, # Valid middle boundary
      { amount: 799.99, expected: 5 }, # Valid upper boundary

      # Valid amount boundaries for 10% discount
      { amount: 800.00, expected: 10 }, # Valid lower boundary
      { amount: 800.00, expected: 10 }, # Valid middle boundary
      { amount: (Float::MAX) - 0.01, expected: 10 }, # Valid upper boundary
      { amount: Float::MAX, expected: 10 } # Valid upper boundary
    ].each do |example|
      it "returns #{example[:amount]}% for #{example[:amount]}" do
        expect(EShop.get_discount_percentage(example[:amount])).to eq(example[:expected])
      end
    end
  end

  # Invalid equivalence partitions for amount: -MAX FLOAT -0.01
  context 'negative tests' do
    [
      { amount: -Float::MAX, expected: 0 }, # Invalid lower boundary
      { amount: -500.68, expected: 0 }, # Invalid middle boundary
      { amount: -0.01, expected: 0 }, # Invalid upper boundary
    ].each do |example|
      it "returns #{example[:expected]} for #{example[:amount]}" do
        expect(EShop.get_discount_percentage(example[:amount])).to eq(example[:expected])
      end
    end
  end
end