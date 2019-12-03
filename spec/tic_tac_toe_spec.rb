# frozen_string_literal: true

require  './lib/player'
require  './lib/board'

player1 = 'Lu'
RSpec.describe Player do
  let(:player) { Player.new(player1, 'X') }

  it 'provides a name' do
    expect(player.name).to(eq(player1))
  end

  it 'provides a sign' do
    expect(player.sign).to(eq('X'))
  end

  it 'gives a winner to false' do
    expect(player.winner).to(eq(false))
  end

  it 'updates winner to true' do
    player.winner = true
    expect(player.winner).to(eq(true))
  end

  it 'can create array' do
    expect(player.array_of_number).to(eq([]))
  end

  it 'can update an array' do
    player.new_array(5)
    expect(player.array_of_number).to(eq([5]))
  end
end

RSpec.describe Board do
  let(:init_board) { Board.new }

  it 'It returns the array' do
    expect(init_board.board).to(eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
  end

  it ' Return false if it\'s an invalid move. ' do
    expect(init_board.includes(11)).to(eq(false))
  end

  it ' Return false if it\'s an invalid move. ' do
    expect(init_board.includes('ana')).to(eq(false))
  end

  it ' Return false if the number is already selected ' do
    init_board.board[0][0] = 'X'
    expect(init_board.includes(1)).to(eq(false))
  end

  it ' Test that the board is updating with the sign ' do
    init_board.board[2][2] = 'X'
    expect(init_board.board).to(eq([[1, 2, 3], [4, 5, 6], [7, 8, 'X']]))
  end

  it ' Returns true if the board is full of signs. ' do
    init_board.board[0][0] = 'X'
    init_board.board[0][1] = 'X'
    init_board.board[0][2] = 'X'
    init_board.board[1][0] = 'X'
    init_board.board[1][1] = 'X'
    init_board.board[1][2] = 'X'
    init_board.board[2][0] = 'X'
    init_board.board[2][1] = 'X'
    init_board.board[2][2] = 'X'
    expect(init_board.full_board).to(eq(true))
  end
end
