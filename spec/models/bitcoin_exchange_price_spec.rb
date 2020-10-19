# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BitcoinExchangePrice, type: :model do
  CURRENCY_CODE = 'NGN'
  DESCRIPTION = 'Nigerian Naira'

  describe 'BitcoinExchangePrice model' do
    bitcoin = Bitcoin.current_price
    bitcoin_exchange_price = BitcoinExchangePrice.new(code: CURRENCY_CODE, description: DESCRIPTION, rate_float: bitcoin['rate_float'])

    context 'arguments validation' do
      # ensure that the code field is never empty
      it { expect(bitcoin_exchange_price).to validate_presence_of(:code) }

      # ensure that the description field is never empty
      it { expect(bitcoin_exchange_price).to validate_presence_of(:description) }

      # ensure that the rate_float field is never empty
      it { expect(bitcoin_exchange_price).to validate_presence_of(:rate_float) }
    end

    it 'should be an instance of the Model class' do
      expect(bitcoin_exchange_price).to be_a BitcoinExchangePrice
    end

    it 'should not have a nil value for code' do
      expect(bitcoin_exchange_price.code).to be_truthy
    end

    it 'should not have a nil value for rate' do
      expect(bitcoin_exchange_price.rate).to be_truthy
    end

    it 'should not have a nil value for description' do
      expect(bitcoin_exchange_price.description).to be_truthy
    end

    it 'should not have a nil value for rate_float' do
      expect(bitcoin_exchange_price.rate_float).to be_truthy
    end

    it "should have rate value equal to delimitered rate_float's value" do
      expect(bitcoin_exchange_price.rate_float.to_s).to eq(bitcoin_exchange_price.rate)
    end
  end

  describe 'fetch class method' do
    bitcoin = Bitcoin.current_price
    bitcoin_price = BitcoinExchangePrice.fetch(bitcoin['rate_float'])

    it 'should be an instance of the Model class' do
      expect(bitcoin_price).to be_a BitcoinExchangePrice
    end

    it "should have an 'NGN' code" do
      expect(bitcoin_price.code).to match('NGN')
    end

    it "should have a 'Nigerian Naira' description" do
      expect(bitcoin_price.description).to match('Nigerian Naira')
    end

    it 'should include rate and rate_float' do
      expect(bitcoin_price).to have_attributes(rate: bitcoin['rate'])
      expect(bitcoin_price).to have_attributes(rate_float: bitcoin['rate_float'])
    end
  end
end
