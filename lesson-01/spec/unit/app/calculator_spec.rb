require_relative '../../../app/calculator'
require_relative '../../../app/calculation_error'

RSpec.describe Calculator do
  context 'positive testing' do
    context '#sum' do
      it 'adds 12 and 13 returns 25' do
        expect(Calculator.sum(12, 13)).to eq(25)
      end

      it 'handles negative numbers' do
        expect(Calculator.sum(-12, -13)).to eq(-25)
      end
    end

    context '#subtract' do
      it 'subtract 11 from 22 and returns 11' do
        expect(Calculator.subtract(22, 11)).to eq(11)
      end

      it 'handles negative numbers' do
        expect(Calculator.subtract(12, -11)).to eq(23)
      end
    end

    context '#multiply' do
      it 'mulitply 3 with 5 returns 15' do
        expect(Calculator.multiply(3, 5)).to eq(15)
      end

      it 'handles negative numbers' do
        expect(Calculator.multiply(3, -5)).to eq(-15)
      end
    end

    context '#divide' do
      it 'divides 9 with 3 returns 3' do
        expect(Calculator.divide(9, 3)).to eq(3)
      end

      it 'handles negative numbers' do
        expect(Calculator.divide(12, -3)).to eq(-4)
      end
    end
  end

  context 'negative testing' do
    context '#sum' do
      it 'throws CalculationError with none numeric values' do
        expect { Calculator.sum(nil, 13) }.to raise_error(CalculationError)
        expect { Calculator.sum(13, nil) }.to raise_error(CalculationError)
        expect { Calculator.sum(13, true) }.to raise_error(CalculationError)
        expect { Calculator.sum('13', 2) }.to raise_error(CalculationError)
      end
    end

    context '#subtract' do
      it 'throws CalculationError with none numeric values' do
        expect { Calculator.subtract(nil, 2) }.to raise_error(CalculationError)
      end
    end

    context '#multiply' do
      it 'throws CalculationError with none numeric values' do
        expect { Calculator.multiply(2, nil) }.to raise_error(CalculationError)
      end
    end

    context '#divide' do
      it 'throws CalculationError with none numeric values' do
        expect { Calculator.divide(2, nil) }.to raise_error(CalculationError)
      end

      it 'throws CalculationError when dividing 0' do
        expect { Calculator.divide(2, 0) }.to raise_error(CalculationError)
      end
    end
  end

end