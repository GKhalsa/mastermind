require 'pry'
require_relative 'game.rb'
require_relative 'responses.rb'

class Mastermind
  include Responses
  attr_reader :game

  def initialize
    @game = Game.new
    intro
  end

  def intro
    puts "Welcome to MASTERMIND

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    engine
  end

  def engine
    catch (:done) do
      loop do
        response = gets.chomp.downcase.to_s
        if response == "p" || response == "play"
          game.play
        elsif response == "i" || response == "instructions"
          Responses.i_response
        elsif response == "q" || response == "quit"
          break
        else
          Responses.non_valid_entry
        end
      end
    end
  end

end

Mastermind.new
