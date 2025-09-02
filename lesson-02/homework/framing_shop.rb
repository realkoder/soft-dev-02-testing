class FramingShop
  def self.calculate_price(width, height)
    raise FrameSizeNotValid unless width >= 30 && width <= 100
    raise FrameSizeNotValid unless height >= 30 && height <= 60

    total_area = width * height
    return 3500 if total_area > 1600

    3000
  end
end