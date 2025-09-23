class Currency
  def initialize(base_currency, api_client = CurrencyAPIClient.new)
    @base_currency = base_currency.upcase
    @api_client = api_client
  end

  def convert(amount, target_currency)
    rates = @api_client.convert(amount)
    rate = rates[target_currency.upcase]
    raise ArgumentError, "Unsupported currency: #{target_currency}" unless rate

    (amount.to_f * rate).round(2)
  end
end
