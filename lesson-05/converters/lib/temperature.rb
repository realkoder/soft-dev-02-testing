class Temperature
  attr_accessor :value, :scale

  def initialize(value, scale)
    @value = value.to_f.round(2)
    @scale = scale.to_s.upcase
  end

  def convert(to_scale)
    to_scale = to_scale.to_s.upcase
    case [scale, to_scale]
    when %w[C F] then c_to_f
    when %w[C K] then c_to_k
    when %w[F C] then f_to_c
    when %w[F K] then f_to_k
    when %w[K C] then k_to_c
    when %w[K F] then k_to_f
    else value # same scale or invalid conversion
    end.round(2)
  end

  private

  def c_to_f
    return 0 unless value >= -273.15

    (value * 9.0 / 5) + 32
  end

  def c_to_k
    value + 273.15;
  end

  def f_to_c
    (value - 32) * 5.0 / 9;
  end

  def f_to_k
    f_to_c + 273.15;
  end

  def k_to_c
    value - 273.15;
  end

  def k_to_f
    (k_to_c * 9.0 / 5) + 32;
  end
end