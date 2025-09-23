class Weight
  attr_accessor :value, :system

  def initialize(value, system)
    @value = value
    @system = system
  end

  def convert
    return 0 unless value > 0

    if system == "metric"
      (value * 2.20462).round(2)
    else
      (value / 2.20462).round(2)
    end
  end
end
