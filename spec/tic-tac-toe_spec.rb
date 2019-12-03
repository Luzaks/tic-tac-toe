require  './lib/player'

player1= "Lu"
RSpec.describe Player do
  let(:player) {Player.new(player1 ,'X')}
  
  it ('provides a name') do 
    expect(player.name).to(eq(player1))

  end

  it ("provides a sign") do
    expect(player.sign).to(eq('X'))
  end

  it ('gives a winner to false') do
  expect(player.winner).to(eq(false))
  end

  it ('updates winner to true') do
    player.winner = true
  expect(player.winner).to(eq(true))
  end

  it ('can create array') do
    expect(player.array_of_number).to(eq([]))
  end

  it ('can update an array') do
    player.new_array(5)
    expect(player.array_of_number).to(eq([5]))
  end
end
