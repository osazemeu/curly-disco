# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    description 'This is the GraphQL API for Bitcoin Exchange Calculator'

    # Field Signatures:
    field :calculate_price, BitcoinExchangePriceType, null: false do
      description 'The current price of the Bitcoin in Nigerian Naira equivalence (NGN)'
      argument :type, TransactionType, required: true do
        description "The type of transaction. It can either be 'buy' or 'sell'"
      end
      argument :margin, Float, required: true do
        description 'The percentage that is used in the calculation of current price.'
      end
      argument :exchange_rate, Float, required: true do
        description 'The custom exchange rate that is used in the calculation of current price.'
      end
    end

    # Implementations:
    def calculate_price(type:, margin:, exchange_rate:)
      bitcoin_price = Bitcoin.current_price('USD')['rate_float']
      computed_margin = margin / 100
      bitcoin_exchange_rate = ExchangeCalculator.compute(bitcoin_price, type, computed_margin, exchange_rate)
      BitcoinExchangePrice.fetch(bitcoin_exchange_rate)
    end
  end
end
