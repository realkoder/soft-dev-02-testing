require_relative '../../homework/framing_shop'
require_relative '../../homework/frame_size_not_valid'

# valid width of the picture is between 30 and 100 cm inclusive
# valid height of the picture is between 30 and 60 cm inclusive
# calculates the area of the image as the product of width and height
# If the surface area exceeds 1600 cm2, the framing price is 3500 kr. Otherwise, the framing price is 3000 kr.

# ============================================================================================================

RSpec.describe FramingShop do
  # Valid equivalence partition for width: 30 - 100 and for height: 30 - 60
  context 'positive tests' do
    [
      { width: 30, height: 30, expected: 3000 }, # Valid lower boundary
      { width: 31, height: 31, expected: 3000 },
      { width: 70, height: 45, expected: 3500 }, # Valid middle boundary
      { width: 99, height: 59, expected: 3500 },
      { width: 100, height: 60, expected: 3500 } # Valid upper boundary
    ].each do |example|
      it "returns #{example[:expected]} for width: #{example[:width]} and height: #{example[:height]}" do
        expect(FramingShop.calculate_price(example[:width], example[:height])).to eq(example[:expected])
      end
    end
  end

  context 'negative tests' do
    [
      # LOWER BOUNDARY
      { width: -Float::MAX.to_i, height: -Float::MAX.to_i, error: FrameSizeNotValid }, # LOWEST
      { width: -500, height: -2_439_423, error: FrameSizeNotValid }, # MIDDLE
      { width: 29, height: 29, error: FrameSizeNotValid }, # UPPER

      # UPPER BOUNDARY
      { width: 101, height: 61, error: FrameSizeNotValid }, # LOWER
      { width: 500, height: 2_439_423, error: FrameSizeNotValid }, # MIDDLE
      { width: Float::MAX.to_i, height: Float::MAX.to_i, error: FrameSizeNotValid }, # LOWEST

    ].each do |example|
      it "returns #{example[:expected]} for width: #{example[:width]} and height: #{example[:height]}" do
        expect { FramingShop.calculate_price(example[:width], example[:height]) }.to raise_error(example[:error])
      end
    end
  end
end