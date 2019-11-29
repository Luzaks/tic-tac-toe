#!/usr/bin/env ruby
# frozen_string_literal: true.
require_relative "../lib/logic"
     
    retries=nil
   
  def game
    puts ' You are about to start the Tic Tac Toe game.'
    puts " What's the name of the first player?"
    player1 = gets.chomp
    puts " What's the name of the second player?"
    player2 = gets.chomp
    puts "\e[H\e[2J"
    test = GameLogic.new
    test.creation_of_board
    play=true
    while play
      test.change_turn
      puts " #{test.turn ? player1 : player2} Choose a number of the board: "
      puts 'Please choose another location: ' until test.move(gets.chomp.to_i)
    
      
        if test.winning_moves
          puts "\e[H\e[2J"
          puts " #{test.turn ? player1 : player2}!!  You Win! "
          play = false
        elsif test.tie != false
          puts "It's a tie!"
          play = false
        else
          test.dif_logic
        end
    end

    puts ' Wanna play again?(Y|N)'

    def retry_game(retries)
        if retries== 'Y'
          play = true
          puts "\e[H\e[2J"
          game
        elsif retries == 'N'
          p ' Bye'
         else 
      return false
    end
  end

    puts ' Please select a valid option' until retry_game(gets.chomp.upcase)
 
  
end
  
game
