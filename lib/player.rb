# frozen_string_literal: true.

class Player #:nodoc:
  attr_reader :name, :sign, :position, :choices, :winner, :array_of_number
  attr_writer :winner

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
