#!/usr/bin/env ruby
# frozen_string_literal: true.

require_relative "../lib/player"
require_relative "../lib/board"

retries = nil
winning_moves = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
play = true
while play
  puts "\e[H\e[2J"
  puts 'Welcome to the Tic-Tac-Toe game. '
  puts 'What\'s the name of the first player? '
  player1 = Player.new(gets.chomp, 'X')
  puts 'What \'s the name of the second player? '
  player2 = Player.new(gets.chomp, "O")
  puts "\e[H\e[2J"
  boards = Board.new
  boards.creation_of_board

  def game(boards, player, winning_moves)
    puts "#{player.name} choose a number of the board:  "
    number = gets.chomp.to_i
    until boards.includes(number)
      puts 'Alert! Invalid move. '
      puts 'Please choose one of the availables locations. '
      number = gets.chomp.to_i
    end
    player.new_array(number)

    case number
    when (1..3)
      boards.board[0][number - 1] = player.sign
    when (4..6)
      boards.board[1][number - 4] = player.sign
    when (7..9)
      boards.board[2][number - 7] = player.sign
    end

    winning_moves.each do |arr|
      if player.array_of_number.length >= 3 && player.array_of_number.sort & arr == arr
        player.winner = true
        break
      end
    end
    puts "\e[H\e[2J"
    boards.creation_of_board
  end

  until boards.full_board
    game(boards, player1, winning_moves)
    break if player1.winner || boards.full_board

    game(boards, player2, winning_moves)
    break if player2.winner || boards.full_board
  end

  if player1.winner
    puts "#{player1.name}!! You Win!!"
  elsif player2.winner
    puts "#{player2.name}!! You Win!!"
  elsif boards.full_board
    puts 'It\'s a tie!'
  end

  puts 'Would you like to play again? ( Y | N )'
  retries = gets.chomp.upcase
  until retries == 'Y' || retries == 'N'
    puts 'Please select a valid option.'
    retries = gets.chomp.upcase
  end

  unless retries == "Y"
    puts 'Good-bye then. Have a nice trip!'
    return false
  end
end
