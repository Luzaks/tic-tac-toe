# frozen_string_literal: true

class GameLogic #:nodoc:
  attr_writer :number
  attr_reader :tie, :token, :board, :turn, :number, :array_of_number
  def initialize
    @array_of_number = []
    @number = nil
    @@token = nil
    @turn = true
    @@tie = nil
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def change_turn
    @@token = @turn ? 'X' : 'O'
  end

  def cases_for_number_selected
    case @number
    when 1..3
      @board[0][@number - 1] = @@token
      @array_of_number << @number
    when 4..6
      @board[1][@number - 4] = @@token
      @array_of_number << @number
    when 7..9
      @board[2][@number - 7] = @@token
      @array_of_number << @number
    end
  end

  def winning_moves
    case
    when @board[0][0] == @@token &&  @board[0][1] == @@token && @board[0][2] == @@token
      true
    when @board[1][0] == @@token &&  @board[1][1] == @@token && @board[1][2] == @@token
      true
    when @board[2][0] == @@token &&  @board[2][1] == @@token && @board[2][2] == @@token
      true
    when @board[0][0] == @@token && @board[1][0] == @@token && @board[2][0] == @@token
      true
    when @board[0][1] == @@token &&  @board[1][1] == @@token && @board[2][1] == @@token
      true
    when  @board[0][2] == @@token && @board[1][2] == @@token && @board[2][2] == @@token
      true
    when  @board[0][0] == @@token && @board[1][1] == @@token && @board[2][2] == @@token
      true
    when  @board[0][2] == @@token && @board[1][1] == @@token && @board[2][0] == @@token
      true
    else
      false
    end
  end

  def dif_logic
    @turn = !@turn
  end

  def clear_board 
     @array_of_number = []
     @board =[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
     @turn = true

  end

  def creation_of_board
    3.times do |x|
      p @board[x].join(' ')
    end
  end

  def tie
    @@tie = @board.all? do |x|
      x.all? do |cell|
        cell.class == String
      end
    end
  end
end
