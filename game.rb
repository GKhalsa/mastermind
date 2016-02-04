require_relative 'responses.rb'
require_relative 'guesser.rb'

class Game
  include Responses
  attr_reader   :key, :guesser
  # attr_accessor 

  def initialize
    @key = Responses.keygen.join
    @guesser = Guesser.new
  end

  def play
    Responses.game_instructions
    game_engine
  end

  def game_engine
    loop do
      guess = gets.to_s.downcase.chomp
      if guess == 'c' || guess == 'cheat'
        puts key
      elsif guess == 'q'
        throw :done
      elsif guess.length == 4
        guesser.the_mind(guess, key)
      elsif guess.length <=> 4
        Responses.over_under(guess)
      else
        Responses.non_valid_entry
      end
    end
  end

end
