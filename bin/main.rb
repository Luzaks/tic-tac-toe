#!/usr/bin/env ruby
# frozen_string_literal: true.
require_relative "../lib/logic"

class UserInput #:nodoc:
  def initialize
    @play = true
    @retry = nil
    @logic = GameLogic.new
  end

  def game
    puts ' You are about to start the Tic Tac Toe game.'
    puts " What's the name of the first player?"
    @player1 = gets.chomp
    puts " What's the name of the second player?"
    @player2 = gets.chomp
    puts "\e[H\e[2J"
    @logic.creation_of_board
    while @play
      @logic.change_turn
      puts " #{@logic.turn ? @player1 : @player2} Choose a number of the board: "
      @logic.move(gets.chomp.to_i)
      if @logic.winning_moves
        puts "\e[H\e[2J"
        puts " #{@logic.turn ? @player1 : @player2}!!  You Win! "
        @play = false
      elsif @logic.tie != false
        puts "It's a tie!"
        @play = false
      else
        @logic.dif_logic
      end
    end
    retry_game
  end

  def retry_game
    puts ' Wanna play again?(Y|N)'
    @retry = gets.chomp
    @retry = @retry.upcase
    until @retry == 'Y' || @retry == 'N'
      puts ' Please select a valid option'
      @retry = gets.chomp
      @retry = @retry.upcase
    end
    if @retry == 'Y'
      @play = true
      puts "\e[H\e[2J"
      UserInput.new
      @logic.clear_board
      game
    else
      p ' Bye'
    end
  end
end

test = UserInput.new
test.game
