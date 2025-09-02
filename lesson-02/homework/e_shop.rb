class EShop
  def self.get_discount_percentage(total_amount)
    puts "LOOK HERE #{total_amount}"
    if total_amount < 300.00
      0
    elsif total_amount < 800.00
      5
    else
      10
    end
  end
end