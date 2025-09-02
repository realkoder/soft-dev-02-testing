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
      { width: 0, height: 0, error: FrameSizeNotValid }, # Far below valid
      { width: 15, height: 15, error: FrameSizeNotValid }, # MIDDLE
      { width: 29, height: 29, error: FrameSizeNotValid }, # Just above valid

      # UPPER BOUNDARY
      { width: 101, height: 61, error: FrameSizeNotValid }, # just above valid
      { width: 150, height: 150, error: FrameSizeNotValid }, # Middle
      { width: 200, height: 200, error: FrameSizeNotValid }, # Far above valid

    ].each do |example|
      it "raises #{example[:error]} for width: #{example[:width]} and height: #{example[:height]}" do
        expect { FramingShop.calculate_price(example[:width], example[:height]) }.to raise_error(example[:error])
      end
    end
  end
end