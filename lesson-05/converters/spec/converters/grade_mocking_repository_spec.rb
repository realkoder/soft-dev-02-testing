require_relative '../../lib/grade'
require_relative '../../repository/grade_repository'

RSpec.describe Grade do
  let(:repository) { instance_double('GradeRepository') }
  let(:grade) { described_class.new(repository) }

  describe 'positive #convert' do
    context 'Danish system converting to American' do
      [
        { value: '-3', expect: 'F' },
        { value: '00', expect: 'F' },
        { value: '02', expect: 'D' },
        { value: '4', expect: 'C' },
        { value: '7', expect: 'B' },
        { value: '10', expect: 'A' },
        { value: '12', expect: 'A+' },
      ].each do |example|
        it "converts Danish grade #{example[:value]} to #{example[:expect]} American grade" do
          allow(repository).to receive(:find_conversion).with(example[:value], 'DK').and_return(example[:expect])
          expect(grade.convert(example[:value], 'DK')).to eq(example[:expect])
        end
      end
    end

    context 'American system converting to Danish' do
      [
        { value: 'F', expect: '00' },
        { value: 'D', expect: '02' },
        { value: 'C', expect: '4' },
        { value: 'B', expect: '7' },
        { value: 'A', expect: '10' },
        { value: 'A+', expect: '12' },
      ].each do |example|
        it "converts American grade #{example[:value]} to #{example[:expect]} Danish grade" do
          allow(repository).to receive(:find_conversion).with(example[:value], 'USA').and_return(example[:expect])
          expect(grade.convert(example[:value], 'USA')).to eq(example[:expect])
        end
      end
    end
  end

  describe 'negative tests' do
    context 'Danish system converting to American' do
      [-4, -2, -1, 1, 3, 5, 6, 8, 9, 11, 13].each do |value|
        it "returns nil for Danish grade #{value}" do
          allow(repository).to receive(:find_conversion).with(value, 'DK').and_return(nil)
          expect(grade.convert(value, 'DK')).to be_nil
        end
      end
    end

    context 'American system converting to Danish' do
      ['E', 'G'].each do |value|
        it "returns nil for American grade #{value}" do
          allow(repository).to receive(:find_conversion).with(value, 'USA').and_return(nil)
          expect(grade.convert(value, 'USA')).to be_nil
        end
      end
    end
  end
end
