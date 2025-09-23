require_relative '../../lib/weight'

RSpec.describe Weight do
  describe 'positive #convert' do
    describe 'metric system - converting to pounds' do

      [
        { value: -500.00, expect: 0 },
        { value: -0.01, expect: 0 },
        { value: -0.02, expect: 0 },
        { value: 0, expect: 0 },
        { value: 0.01, expect: 0.02 },
        { value: 500, expect: 1_102.31 },
      ].each do |example|
        it "converts #{example[:value]} kilograms to #{example[:expect]} pounds" do
          weight = described_class.new(example[:value], 'metric')
          expect(weight.convert).to eq(example[:expect])
        end
      end
    end

    describe 'imperial system - converting to kilograms' do

      [
        { value: -500.00, expect: 0 },
        { value: -0.01, expect: 0 },
        { value: -0.02, expect: 0 },
        { value: 0, expect: 0 },
        { value: 0.01, expect: 0.0 },
        { value: 500, expect: 226.8 },
      ].each do |example|
        it "converts #{example[:value]} pounds to #{example[:expect]} kilograms" do
          length = described_class.new(example[:value], 'imperial')
          expect(length.convert).to eq(example[:expect])
        end
      end
    end
  end
end
