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
    @code = code
    @rate = number_with_delimiter(rate_float)
    @description = description
    @rate_float = rate_float
  end

  # Returns an instance of the bitcoin exchange price
  def self.fetch(bitcoin_exchange_rate)
    new(code: CURRENCY_CODE, description: DESCRIPTION, rate_float: bitcoin_exchange_rate)
  end
end
