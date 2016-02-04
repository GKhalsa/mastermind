require_relative 'responses.rb'
require_relative 'guesser.rb'

class Game
  include Responses
  attr_reader :key

  def initialize
    @key = Responses.keygen
    @guesser = Guesser.new
  end

  def play
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    game_engine
  end

  def game_engine
    loop do
      guess = gets.to_s.downcase.chomp
      if guess == 'key'
        puts key.join
      elsif guess == 'q'
        throw :done
      elsif guess.length == 4
        @guesser
      else
        Responses.non_valid_entry
      end
    end
  end

  if guess.chars.all? { |guess_letter| key.include?(guess_letter)}
  @guesser
  end


end
