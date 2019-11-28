# frozen_string_literal: true

class  GameLogic
  attr_accessor :board, :array_of_number, :number, :token, :turn
  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @array_of_number = []
    @number = nil
    @token = nil
    @turn = true
  end

  def creation_of_board
    3.times do |x|
      p @board[x].join(' ')
    end
  end

  def change_turn
    @token = @turn ? 'X' : 'O'
  end

  def cases_for_number_selected
    case @number
    when 1..3
      @board[0][@number - 1] = @token
      @array_of_number << @number
    when 4..6
      puts @board[1][@number - 4] = @token
      @array_of_number << @number
    when 7..9
      puts @board[2][@number - 7] = @token
      @array_of_number << @number
    else
      puts 'Estoy en el else'
    end
  end

  def winning_moves 
    case 
      when @board[0][0] == @token &&  @board[0][1] == @token && @board[0][2] == @token
       return true
      when @board[1][0] == @token &&  @board[1][1] == @token && @board[1][2] == @token
        return true
      when @board[2][0] == @token &&  @board[2][1] == @token && @board[2][2] == @token
        return true
      when @board[0][0] == @token && @board[1][0] == @token && @board[2][0] == @token
        return true
      when @board[0][1] == @token &&  @board[1][1] == @token &&  @board[2][1] == @token 
        return true
      when  @board[0][2] == @token && @board[1][2] == @token && @board[2][2] == @token
        return true
      when  @board[0][0] == @token && @board[1][1] == @token && @board[2][2] == @token
        return true
      when  @board[0][2] == @token && @board[1][1] == @token && @board[2][0] == @token
        return true
      else 
        return false
    end
  end
end