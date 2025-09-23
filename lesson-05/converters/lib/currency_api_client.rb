require 'net/http'
require 'uri'
require 'json'
require 'dotenv/load'

class CurrencyAPIClient
  API_URL = 'https://api.currencyapi.com/v3/convert'

  def initialize
    @api_key = ENV['FREECURRENCYAPI_KEY']
    raise ArgumentError, 'API key is required' if @api_key.nil? || @api_key.empty?
  end

  def convert(amount)
    uri = URI(API_URL)
    params = { value: amount }
    uri.query = URI.encode_www_form(params)

    request = Net::HTTP::Get.new(uri)
    request['apikey'] = @api_key

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    json = JSON.parse(response.body)
    raise "API Error: #{json}" unless json['data'] && json['data'][target_currency] && json['data'][target_currency]['value']

    json['data'][target_currency]['value'].round(2)
  end
end
