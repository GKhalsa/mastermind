require_relative 'responses.rb'
require_relative 'guesser.rb'

class Game
  include Responses
  attr_reader :key, :guesser
  # attr_accessor

  def initialize
    @key = Responses.keygen.join
    @guesser = Guesser.new
  end

  def play
    #would you like to play beginning medium or hard
    Responses.game_instructions
    game_engine
  end

  def game_engine
    loop do
      guess = gets.to_s.downcase.chomp
      if guess == 'c' || guess == 'cheat'
        puts key
      elsif guess == 'q' || guess == 'quit'
        throw :done
      elsif Responses.is_i?(guess)
      elsif guess.length == 4
        guesser.the_mind(guess, key)
      elsif guess.length <=> 4
        Responses.over_under(guess)
      end
    end
  end

end
