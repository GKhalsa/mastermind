require_relative 'responses.rb'
require_relative 'guesser.rb'

class Game
  include Responses
  attr_reader :key, :ai
  attr_accessor :guesser

  def initialize
    @key = Responses.keygen.join
    @ai = false
    @guesser ||= Guesser.new(ai)
  end

  def play
    puts "press 1 for single player"
    puts "press 2 for computer challenge mode"
    play_mode = gets.to_i
    play_mode.even? ? @ai = true : @ai = false
    Responses.game_instructions
    game_engine
  end

  def game_engine
    loop do
      guess = gets.to_s.downcase.chomp.delete(' ')
      if guess == 'c' || guess == 'cheat'
        puts key
      elsif guess == 'q' || guess == 'quit'
        throw :done
      elsif Responses.is_i?(guess)
      elsif guess.length == 4
        guesser.ai = ai
        guesser.the_mind(guess, key)
      elsif guess.length <=> 4
        Responses.over_under(guess)
      end
    end
  end

end
