# frozen_string_literal: true

class Board #:nodoc:
  attr_reader :board, :number

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @tie = nil
    @tie2 = nil
  end

  def includes(number)
    @tie = @board.any? do |x|
      x.any? do |cell|
        cell == number
      end
    end
  end

  def full_board
    @tie2 = @board.all? do |x|
      x.all? do |cell|
        cell.class == String
      end
    end
  end
end
