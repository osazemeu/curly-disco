# frozen_string_literal: true

module Types
  class BitcoinExchangePriceType < Types::BaseObject
    description 'The current bitcoin price in Nigerian Naira'

    # Field Signatures:
    field :code, String, null: false, description: 'The currency code'
    field :rate, String, null: false, description: 'The delimitered bitcoin price'
    field :description, String, null: false, description: 'Describes the currency'
    field :rate_float, Float, null: false, description: 'The current bitcoin price'
  end
end
