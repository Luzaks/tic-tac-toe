# frozen_string_literal: true.

class Player #:nodoc:
  attr_accessor :choices, :winner, :array_of_number
  attr_reader :name, :sign, :position

  def initialize(name, sign, winner = false)
    @name = name
    @sign = sign
    @array_of_number = []
    @winner = winner
    @position = nil
  end

  def new_array(number)
    @array_of_number << number
  end
end
