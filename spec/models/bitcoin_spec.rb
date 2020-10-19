# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bitcoin, type: :model do
  describe 'Bitcoin price API' do
    bitcoin = Bitcoin.current_price

    # Ensure it's a hash that is returned
    it 'is to be a Hash object' do
      expect(bitcoin.is_a?(Hash)).to be_truthy
    end

    context 'attributes validation' do
      it 'should have the defined attributes' do
        expect(bitcoin).to include('code', 'symbol', 'rate', 'rate_float')
      end
    end

    context 'attributes type validation' do
      # ensure the value of code is 'USD'
      it "should have 'USD' as currency code" do
        expect(bitcoin['code']).to match('USD')
      end

      # ensure the value of symbol is '$'
      it "should have '$' as currency symbol" do
        expect(bitcoin['symbol']).to match('$')
      end

      # ensure the floating point value (converted) of rate is equal to rate_float
      it 'should have a floating point value of rate equal to rate_float' do
        expect(bitcoin['rate_float']).to eq(bitcoin['rate'].to_f)
      end
    end
  end
end
