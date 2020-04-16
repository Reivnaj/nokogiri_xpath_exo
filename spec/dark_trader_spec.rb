require_relative '../lib/dark_trader'

describe 'what s the value of a crypto monnay' do
  # Hint: 'def who_is_bigger(a, b, c)'
  it 'tells the value of a crypto monnay from the website coinmarketcap' do
    expect(whats_the_currencie_value('yo')).to eq('erreur')
  end
end
