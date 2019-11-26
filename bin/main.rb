#!/usr/bin/env ruby
puts "Hello World!!"


class UserInput

  def initialize

    #puts "You are about to start the Tic Tac Toe game."
    #puts "What's the name of the first player?"
    #@player1 = gets.chomp
    #puts "What's the name of the second player?"
    #@player2 = gets.chomp

    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @turn = true
  end

  def creation_of_board
    3.times do |x|
      p @board[x].join(' ')
    end
  end

  def game
    creation_of_board
    move

  end
  def player_symbol
    puts "Choose a symbol:\n 1.- X\n 2.- O"
    symbol_1 = gets.chomp
    symbol_2 = gets.chomp
    p symbol_1
    p symbol_2
  end
  def move
    puts "Choose a number of the board: "
    number = gets.chomp
    if number > "9" && number < "1"
      puts "Error, you need to choose another number for moves."
    else
      @board.split(",").map {|s|s.to_i}
      case number
      when number == 1 || number == 2 || number == 3
        puts @board[0][number - 1]
        else
      end
    end

  end
end
prueba = UserInput.new
prueba.game
#ESTABLISH X OR O FOR EACH USER


#ASK PLAYER FOR A MOVE 


#UPDATE THE BOARD
