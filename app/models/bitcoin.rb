# frozen_string_literal: true

class Bitcoin
  include HTTParty

  base_uri 'https://api.coindesk.com/v1/bpi'

  format :json

  # Dummy response object
  BITCOIN_PRICE = {
    'code' => 'USD',
    'symbol' => '$',
    'rate' => '126.5235',
    'rate_float' => 126.5235
  }.freeze

  # Fetch current price of bitcoin from CoinDesk API
  def self.current_price(currency = 'USD')
    if Rails.env.development? || Rails.env.test?
      BITCOIN_PRICE
    else
      get("/currentprice/#{currency}.json")['bpi'][currency.to_s]
    end
  end
end
