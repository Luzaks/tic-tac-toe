#!/usr/bin/env ruby
# frozen_string_literal: true.
puts 'Hello World!!'
require_relative "../lib/logic"

class UserInput #:nodoc:
  def initialize
    puts 'You are about to start the Tic Tac Toe game.'
    puts "What's the name of the first player?"
    @player1 = gets.chomp
    puts "What's the name of the second player?"
    @player2 = gets.chomp
    @play = true
    @retry = nil
    @logic = GameLogic.new
  end

  def game
    @logic.creation_of_board
    while @play
      @logic.change_turn
      move
      if @logic.winning_moves
        puts "#{@logic.turn ? @player1 : @player2}  ya ganaste "
        @play = false
      elsif @logic.tie != false
        puts "Es un empate"
        @play = false
      else
        @logic.turn = !@logic.turn
      end
    end
     retry_game
  end

  def move
    puts "#{@logic.turn ? @player1 : @player2} Choose a number of the board: "
    @logic.number = gets.chomp
    @logic.number = @logic.number.to_i
   
    until @logic.number < 10 && @logic.number.positive? && @logic.array_of_number.none?(@logic.number)
      @logic.array_of_number.none?(@logic.number)
      puts 'Please choose another location: '
      @logic.number = gets.chomp
      @logic.number = @logic.number.to_i
    end
    @logic.cases_for_number_selected
    @logic.array_of_number
    @logic.creation_of_board
   
  end
 
   def retry_game
    puts "Wanna play again?(Y|N)"
    @retry = gets.chomp
    @retry = @retry.upcase  
    until @retry== "Y" || @retry == "N"
      puts "Please select a valid option"
      @retry = gets.chomp
      @retry = @retry.upcase  
    end
    if @retry == "Y"
    @play = true
    UserInput.new
    @logic.array_of_number = []
    game
    else
   p "bye"
    end
  end


end

prueba = UserInput.new
prueba.game
