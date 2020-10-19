# frozen_string_literal: true

RSpec.describe Types::QueryType do
  subject { described_class }

  it 'has a :calculate_price field' do
    expect(subject).to have_field(:calculate_price)
  end
end
