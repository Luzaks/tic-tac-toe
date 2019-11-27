#!/usr/bin/env ruby

puts 'Hello World!!'

class UserInput #:nodoc:
  def initialize
    puts 'You are about to start the Tic Tac Toe game.'
    puts "What's the name of the first player?"
    @player1 = gets.chomp
    puts "What's the name of the second player?"
    @player2 = gets.chomp

    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @turn = true
    @play = true
    @token = nil
    @number= nil
    @array_of_number= []
  end

  def creation_of_board
    3.times do |x|
      p @board[x].join(' ')
    end
  end

  def game
    counter = 0
    creation_of_board
    while @play
      @token = @turn ? 'X' : 'O'
      move #method for adding an x or and o to the board 
      # compares_move   method for comparing if its a winning move, draw move, invalid, or continue playing
      @play = counter < 8
      counter += 1
      p counter
      @turn = !@turn
      #  end_game
    end
  end

  def player_symbol
    puts "{ @turn ? @player1 : @player2 },Choose a symbol:\n 1.- X\n 2.- O"
    symbol_one = gets.chomp
    symbol_two = gets.chomp
    p symbol_one
    p symbol_two
  end

  def move
    puts "#{@turn ? @player1 : @player2} Choose a number of the board: "
    @number = gets.chomp
    @number = @number.to_i
    # @array_of_number << @number


    #until  @board.select { |x| x.select { |y| puts y == number } }
      #puts 'Please choose another location: '
     # number = gets.chomp
     # number = number.to_i
    #end
    until  @number < 10 && @number > 0 && @array_of_number.none?(@number)
    #@board.select { |x| x.select { |y| puts y == number } }
    p @array_of_number.none?(@number)
      puts 'Please choose another location: '
      @number = gets.chomp
      @number = @number.to_i
      # @array_of_number << @number
    end 
    cases_for_number_selected
    p @array_of_number 
    creation_of_board
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
           puts "Estoy en el else"
          end
        end



  def compares_move
    #compares if its a winning move, a draw move, a losing move, or continues playing
  end

  def end_game
    #method for ending game showing message: tie, win (player 1 or 2)
  end
end


prueba = UserInput.new
prueba.game
