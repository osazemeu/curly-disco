# frozen_string_literal: true

RSpec.describe Types::BitcoinExchangePriceType do
  subject { described_class }
  types = GraphQL::Define::TypeDefiner.instance

  it 'has a :code field of String type' do
    # Ensure that the field code is of type String
    expect(subject).to have_field(:code).that_returns(!types.String)
  end

  it 'has a :rate field of String type' do
    # Ensure the field is of String type
    expect(subject).to have_field(:rate).that_returns(!types.String)
  end

  it 'has a :description field of String type' do
    # Ensure the field is of String type
    expect(subject).to have_field(:description).that_returns(!types.String)
  end

  it 'has a :rate_float field of Float type' do
    # Ensure the field is of Float type
    expect(subject).to have_field(:rate_float).that_returns(!types.Float)
  end
end
