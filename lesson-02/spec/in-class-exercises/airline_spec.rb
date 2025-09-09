require_relative '../../in-class-exercises/airline'

RSpec.describe Airline do
  context 'children under 2' do
    it 'gives 100 %' do
      discount = Airline.calculate_discount(age: 1, destination: 'India', departure_day: 'Tuesday', stay_length: 5)
      expect(discount).to eq(100)
    end
  end

  context 'children 3 - 17' do
    it 'gives 40 %' do
      discount = Airline.calculate_discount(age: 5, destination: 'India', departure_day: 'Tuesday', stay_length: 5)
      expect(discount).to eq(40)
    end

    context 'additional 10 % when staying longer than 6 days' do
      it 'gives 50 %' do
        discount = Airline.calculate_discount(age: 5, destination: 'India', departure_day: 'Tuesday', stay_length: 6)
        expect(discount).to eq(50)
      end
    end
  end

  context 'adults to India' do
    it 'gives 20% discount if not Mon/Fri and < 6 days stay' do
      discount = Airline.calculate_discount(age: 30, destination: 'India', departure_day: 'Tuesday', stay_length: 5)
      expect(discount).to eq(20)
    end

    it 'gives 30% discount if stay > 5 days' do
      discount = Airline.calculate_discount(age: 30, destination: 'India', departure_day: 'Wednesday', stay_length: 6)
      expect(discount).to eq(30)
    end

    it 'gives 0% discount on Mon/Fri and stay length < 6' do
      discount = Airline.calculate_discount(age: 30, destination: 'India', departure_day: 'Friday', stay_length: 4)
      expect(discount).to eq(0)
    end
  end

  context 'adults to Asia (not India)' do
    it 'gives 25% discount if not Mon/Fri and <6 days' do
      discount = Airline.calculate_discount(age: 40, destination: 'Asia', departure_day: 'Tuesday', stay_length: 5)
      expect(discount).to eq(25)
    end

    it 'gives 35% discount if stay ≥6 days' do
      discount = Airline.calculate_discount(age: 40, destination: 'Asia', departure_day: 'Thursday', stay_length: 6)
      expect(discount).to eq(35)
    end

    it 'gives 0% discount on Mon/Fri and days < 6' do
      discount = Airline.calculate_discount(age: 40, destination: 'Asia', departure_day: 'Monday', stay_length: 5)
      expect(discount).to eq(0)
    end
  end
end
