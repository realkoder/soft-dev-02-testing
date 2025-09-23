class Length
  attr_accessor :value, :system

  def initialize(value, system)
    @value = value
    @system = system
  end

  def convert
    return 0 unless value >= 0

    if system == 'metric'
      (value / 2.54).round(2) # cm → in
    else
      (value * 2.54).round(2) # in → cm
    end
  end
end
