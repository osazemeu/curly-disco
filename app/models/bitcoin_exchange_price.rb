# frozen_string_literal: true

class BitcoinExchangePrice
  include ActiveModel::Validations
  include ActionView::Helpers::NumberHelper

  CURRENCY_CODE = 'NGN'
  DESCRIPTION = 'Nigerian Naira'

  attr_accessor :code, :rate, :description, :rate_float

  # Validations
  validates :code, presence: true
  validates :rate_float, presence: true, numericality: true
  validates :description, presence: true

  def initialize(code:, description:, rate_float:)
    @code = code || CURRENCY_CODE
    @rate = number_with_delimiter(rate_float)
    @description = description || DESCRIPTION
    @rate_float = rate_float
  end

  class << self
    # Returns an instance of the bitcoin exchange price
    def fetch(bitcoin_exchange_rate)
      new(code: CURRENCY_CODE, description: @description, rate_float: bitcoin_exchange_rate)
    end
  end
end
