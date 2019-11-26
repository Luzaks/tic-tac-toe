#!/usr/bin/env ruby
puts "Hello World!!"


class UserInput

  def initialize()
  # def introduction
  begin 
    puts "You are about to start the Tic Tac Toe game."
    puts "What's the name of the first player?"
    @player1 = gets.chomp
    puts "What's the name of the second player?"
    @player2= gets.chomp
  # end
    end 
  end
end
prueba= UserInput.new


#ESTABLISH X OR O FOR EACH USER

# CREATION OF BOARD
# board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# 3.times do |x|
# p " #{board[(3*x)]}  #{board[(3*x)+1]}  #{board[(3*x)+2]}"

# end


#ASK PLAYER FOR A MOVE 


#UPDATE THE BOARD
