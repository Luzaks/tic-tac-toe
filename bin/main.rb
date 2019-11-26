#!/usr/bin/env ruby
puts "Hello World!!"


class UserInput

  def initialize

    puts "You are about to start the Tic Tac Toe game."
    puts "What's the name of the first player?"
    @player1 = gets.chomp
    puts "What's the name of the second player?"
    @player2 = gets.chomp

    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @turn = true
    @play =true
    @token
  end

  def creation_of_board
    3.times do |x|
      p @board[x].join(' ')
    end
  end

  def game
      counter= 0
      creation_of_board
    while @play
      @turn ? @token = "X": @token = "O"
      move
      @play = counter < 8
      counter += 1
      p counter
      @turn= !@turn
    end
  end

  def player_symbol
    puts "{ @turn ? @player1 : @player2 },Choose a symbol:\n 1.- X\n 2.- O"
    symbol_1 = gets.chomp
    symbol_2 = gets.chomp
    p symbol_1
    p symbol_2
  end

  def move
    puts "#{ @turn ? @player1 : @player2 } Choose a number of the board: "
    number = gets.chomp
     number=number.to_i
    if number > 9 || number < 1
      p "Error, you need to choose another number for moves."
    else
      case number
      when 1..3
         @board[0][number - 1] = @token

         creation_of_board()
      when 4..6
        puts @board[1][number - 4] = @token
        creation_of_board()

      else
        puts @board[2][number - 7] = @token
        creation_of_board()
      end
    end
  end
end
prueba = UserInput.new
prueba.game

