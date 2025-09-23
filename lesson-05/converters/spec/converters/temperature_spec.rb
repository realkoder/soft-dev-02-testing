require_relative '../../lib/temperature'

RSpec.describe Temperature do
  describe 'positive #convert' do
    describe 'C to F' do
      [
        { value: -500.00, expect: 0 },
        { value: -273.17, expect: 0 },
        { value: -273.16, expect: 0 },
        { value: -273.15, expect: -459.67 },
        { value: -273.14, expect:  -459.65 },
        { value: 0, expect: 32 },
        { value: 32, expect: 89.6 },
      ].each do |example|
        it "converts #{example[:value]} C to #{example[:expect]} F" do
          temperature = described_class.new(example[:value], 'C')
          expect(temperature.convert('F')).to eq(example[:expect])
        end
      end
    end

    describe 'C to K' do

    end

    describe 'F to C' do

    end

    describe 'F to K' do

    end

    describe 'K to C' do

    end

    describe 'K to F' do

    end

  end
end
