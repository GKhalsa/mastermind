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

  # def one_player
  #   Responses.game_instructions
  #   game_engine#(level)
  # end
  #
  # def computer_player
  #   Responses.game_instructions
  #   @ai = true
  #   game_engine
  # end

  def game_engine#(level)#(hard, medium, or easy)
    loop do
      guess = gets.to_s.downcase.chomp.delete(' ')
      #mastermind_ai.guesss
      if guess == 'c' || guess == 'cheat'
        puts key
      elsif guess == 'q' || guess == 'quit'
        throw :done
      elsif Responses.is_i?(guess)
      elsif guess.length == 4 #(variable)
        guesser.ai = ai
        guesser.the_mind(guess, key)
        # binding.pry #(hard, medium, easy in arg)
      elsif guess.length <=> 4 #variable, num or something
        Responses.over_under(guess)
      end
    end
  end

end
