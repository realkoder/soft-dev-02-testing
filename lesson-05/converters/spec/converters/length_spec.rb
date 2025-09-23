require_relative '../../lib/length'

RSpec.describe Length do
  describe 'positive #convert' do
    describe 'metric system - converting to inches' do

      [
        { value: -500.00, expect: 0 },
        { value: -0.01, expect: 0 },
        { value: -0.02, expect: 0 },
        { value: 0, expect: 0 },
        { value: 0.01, expect: 0 },
        { value: 500, expect: 196.85 },
      ].each do |example|
        it "converts #{example[:value]} cm to #{example[:expect]} inches" do
          length = described_class.new(example[:value], 'metric')
          expect(length.convert).to eq(example[:expect])
        end
      end
    end

    describe 'imperial system - converting to centimeters' do

      [
        { value: -500.00, expect: 0 },
        { value: -0.01, expect: 0 },
        { value: -0.02, expect: 0 },
        { value: 0, expect: 0 },
        { value: 0.01, expect: 0.03 },
        { value: 500, expect: 1_270 },
      ].each do |example|
        it "converts #{example[:value]} inches to #{example[:expect]} cm" do
          length = described_class.new(example[:value], 'imperial')
          expect(length.convert).to eq(example[:expect])
        end
      end
    end
  end
end
