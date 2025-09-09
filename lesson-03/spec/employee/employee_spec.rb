require_relative '../../employee/employee'

RSpec.describe Employee do

  context 'positive tests' do
    context 'valid creation' do
      it 'creates an employee wih valid attributes' do
        employee = Employee.new('1234567890', 'John', 'Doe', 'IT', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark')
        expect(employee).to be_a(Employee)
        expect(employee.first_name).to eq('John')
        expect(employee.educational_level_name).to eq('Secondary')
      end
    end

    describe 'validations' do
      context 'CPR' do
        [
          ['1234567891', 'John', 'Doe', 'IT', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "create employee if CPR is 10 digits (got #{cpr})" do
            expect(Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)).to be_a(Employee)
          end
        end
      end

      context 'names' do
        [
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "creates employee if first_name contains - (got #{first_name})" do
            expect(Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)).to be_a(Employee)
          end
        end
      end

      context 'department' do
        [
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'HR', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'Sales', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "creates employee if department is (got #{department})" do
            expect(Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)).to be_a(Employee)
          end
        end
      end

      context 'base salary' do
        [
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 20_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'HR', 20_001, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'Sales', 30_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'Sales', 39_999, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'Sales', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "creates employee if base_salary is (got #{base_salary})" do
            expect(Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)).to be_a(Employee)
          end
        end
      end

      context 'educational level 0 - 3' do
        it 'accepts 0 == None' do
          emp = Employee.new('1234567891', 'John', 'Doe', 'HR', 20_001, 0, '01/01/1990', '15/03/2015', 'Denmark')
          expect(emp.educational_level_name).to eq('None')
        end

        it 'accepts 1 == Primary' do
          emp = Employee.new('1234567891', 'John', 'Doe', 'HR', 20_001, 1, '01/01/1990', '15/03/2015', 'Denmark')
          expect(emp.educational_level_name).to eq('Primary')
        end

        it 'accepts 2 == Secondary' do
          emp = Employee.new('1234567891', 'John', 'Doe', 'HR', 20_001, 2, '01/01/1990', '15/03/2015', 'Denmark')
          expect(emp.educational_level_name).to eq('Secondary')
        end

        it 'accepts 3 == Tertiary' do
          emp = Employee.new('1234567891', 'John', 'Doe', 'HR', 20_001, 3, '01/01/1990', '15/03/2015', 'Denmark')
          expect(emp.educational_level_name).to eq('Tertiary')
        end
      end

      context 'date of birth' do
        it 'creates over 18 years old' do
          old_enough = (Date.today - 18 * 365).strftime('%d/%m/%Y')
          emp = Employee.new('1234567891', 'John', 'Doe', 'HR', 20_001, 3, '01/01/1990', '15/03/2015', 'Denmark')
          expect(emp).to be_a(Employee)
        end
      end

      context 'date of employment' do
        [
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 20_000, 2, '01/01/1990', (Date.today).strftime("%d/%m/%Y"), 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 20_000, 2, '01/01/1990', (Date.today - 1).strftime("%d/%m/%Y"), 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 20_000, 2, '01/01/1990', (Date.today - 1800).strftime("%d/%m/%Y"), 'Denmark'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "creates employee if date_of_deployment is (got #{doe})" do
            expect(Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)).to be_a(Employee)
          end
        end
      end

      context 'country' do
        [
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 20_000, 2, '01/01/1990', (Date.today).strftime("%d/%m/%Y"), 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 20_000, 2, '01/01/1990', (Date.today - 1).strftime("%d/%m/%Y"), 'Germany'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 20_000, 2, '01/01/1990', (Date.today - 100).strftime("%d/%m/%Y"), 'Italy'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "creates employee if country is (got #{country})" do
            expect(Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)).to be_a(Employee)
          end
        end
      end
    end
  end

  context 'negative tests' do
    describe 'validations' do
      context 'CPR' do
        [
          ['', 'John', 'Doe', 'IT', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1', 'John', 'Doe', 'IT', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['5', 'John', 'Doe', 'IT', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['9', 'John', 'Doe', 'IT', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "raises error if CPR is not 10 digits (got #{cpr})" do
            expect {
              Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)
            }.to raise_error(ArgumentError, /CPR must be 10 digits/)
          end
        end
      end

      context 'names' do
        [
          ['1213121212', 'Jo10', 'Doe', 'IT', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "raises error if name contains numbers (got #{first_name})" do
            expect {
              Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)
            }.to raise_error(ArgumentError, /Invalid first name/)
          end
        end
      end

      context 'Department' do
        [
          ['1213121212', 'John', 'Doe', 'Cooking', 40_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "raises error if name contains numbers (got #{first_name})" do
            expect {
              Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)
            }.to raise_error(ArgumentError, /Invalid department/)
          end
        end
      end

      context 'base salary' do
        [
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 0, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'HR', 1, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'Sales', 10_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'Sales', 19_999, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'Sales', 100_001, 2, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'Sales', 500_000, 2, '01/01/1990', '15/03/2015', 'Denmark'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "raises error if base_salary is (got #{base_salary})" do
            expect {
              Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)
            }.to raise_error(ArgumentError, /Base salary must be between/)
          end
        end
      end

      context 'educational level' do
        [
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 20_000, 4, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 20_000, 10, '01/01/1990', '15/03/2015', 'Denmark'],
          ['1234567891', 'Jean-Luc', 'Doe-Lo', 'IT', 20_000, 20, '01/01/1990', '15/03/2015', 'Denmark'],
        ].each do |cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country|
          it "raises error if educational_level is (got #{educational_level})" do
            expect {
              Employee.new(cpr, first_name, last_name, department, base_salary, educational_level, dob, doe, country)
            }.to raise_error(ArgumentError, /Invalid educational level/)
          end
        end
      end

      context 'date of birth' do

        it 'rejects under 18 years old' do
          too_young = (Date.today - 10 * 365).strftime('%d/%m/%Y')
          expect {
            Employee.new('1234567891', 'John', 'Doe', 'IT', 20_000, 2, too_young, '15/03/2015', 'Denmark')
          }.to raise_error(ArgumentError, /must be at least 18/)
        end
      end

      context 'date of employment' do
        it 'rejects future date' do
          future = (Date.today + 5).strftime('%d/%m/%Y')
          expect { Employee.new('1234567891', 'John', 'Doe', 'IT', 20_000, 2, '01/01/1990', future, '') }
            .to raise_error(ArgumentError, /cannot be in the future/)
        end
      end

      context 'country' do
        it 'rejects empty' do
          expect {
            Employee.new('1234567891', 'John', 'Doe', 'IT', 20_000, 2, '01/01/1990', '15/03/2015', '')
          }.to raise_error(ArgumentError, /Invalid country/)
        end
      end

    end
  end
end

