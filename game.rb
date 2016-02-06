require_relative 'responses.rb'
require_relative 'guesser.rb'

class Game
  include Responses
  attr_reader :key, :guesser

  def initialize
    @key = Responses.keygen.join
    @guesser ||= Guesser.new
  end

  def play
    # puts "would you like to play (e)asy (m)edium or (h)ard?"
    # puts "would you like to play 2player?(y/n)"
    # level = gets.to_s.downcase.chomp.delete(' ')
    Responses.game_instructions
    game_engine#(level)
  end

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
        guesser.the_mind(guess, key) #(hard, medium, easy in arg)
      elsif guess.length <=> 4 #variable, num or something
        Responses.over_under(guess)
      end
    end
  end

end
