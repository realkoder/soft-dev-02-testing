require 'Date'

class Employee

  EDUCATION_LEVELS = {
    0 => 'None',
    1 => 'Primary',
    2 => 'Secondary',
    3 => 'Tertiary'
  }.freeze

  DEPARTMENTS = ['HR', 'Finance', 'IT', 'Sales', 'General Services'].freeze

  attr_reader :cpr, :first_name, :last_name, :department, :base_salary, :educational_level, :date_of_birth, :date_of_employment, :country

  def initialize(cpr, first_name, last_name, department, base_salary, educational_level, date_of_birth, date_of_employment, country)
    self.cpr = cpr
    self.first_name = first_name
    self.last_name = last_name
    self.department = department
    self.base_salary = base_salary
    self.educational_level = educational_level
    self.date_of_birth = date_of_birth
    self.date_of_employment = date_of_employment
    self.country = country
  end

  def cpr=(value)
    raise ArgumentError, "CPR must be 10 digits" unless value.to_s.match?(/^\d{10}$/)

    @cpr = value.to_s
  end

  def first_name=(value)
    raise ArgumentError, 'Invalid first name' unless value.match?(/^[A-Za-z\s-]{1,30}$/)

    @first_name = value
  end

  def last_name=(value)
    raise ArgumentError, 'Invalid last name' unless value.match?(/^[A-Za-z\s-]{1,30}$/)

    @last_name = value
  end

  def department=(value)
    raise ArgumentError, 'Invalid department' unless DEPARTMENTS.include?(value)

    @department = value
  end

  def base_salary=(value)
    raise ArgumentError, 'Base salary must be between 20_000 and 100_000' unless value.to_i.between?(20_000, 100_000)

    @base_salary = value.to_i
  end

  def educational_level=(value)
    raise ArgumentError, 'Invalid educational level' unless EDUCATION_LEVELS.key?(value.to_i)

    @educational_level = value.to_i
  end

  def educational_level_name
    EDUCATION_LEVELS[@educational_level]
  end

  def date_of_birth=(value)
    date_of_birth = Date.strptime(value, '%d/%m/%Y') rescue nil
    raise ArgumentError, 'Invalid date of birth format' unless date_of_birth
    raise ArgumentError, 'Employee must be at least 18 years old' if date_of_birth > Date.today << (18 * 12)

    @date_of_birth = date_of_birth
  end

  def date_of_employment=(value)
    date_of_employment = Date.strptime(value, '%d/%m/%Y') rescue nil
    raise ArgumentError, 'Invalid date of employment format' unless date_of_employment
    raise ArgumentError, 'Employment date cannot be in the future' if date_of_employment > Date.today

    @date_of_employment = date_of_employment
  end

  def country=(value)
    raise ArgumentError, 'Invalid country' if value.to_s.strip.empty?

    @country = value
  end

  # --- Business Logic Methods ---

  def get_salary
    @base_salary + (@educational_level * 1220)
  end

  def get_discount
    years = ((Date.today - @date_of_employment).to_i / 365).floor
    years * 0.5
  end

  def get_shipping_costs
    case @country.downcase
    when 'denmark', 'norway', 'sweden'
      0
    when 'iceland', 'finland'
      50
    else
      100
    end
  end
end
