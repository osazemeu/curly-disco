# frozen_string_literal: true

module Types
  class TransactionType < Types::BaseEnum
    description 'This is the list of available transaction types'

    value 'BUY', "Specify its a 'buy' transaction"
    value 'SELL', "Specify its a 'sell' transaction"
  end
end
