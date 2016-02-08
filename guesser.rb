require_relative 'responses.rb'
require_relative 'game.rb'
require_relative 'mastermind_ai.rb'
require_relative 'endgame.rb'

class Guesser
  include Responses
  attr_reader :name, :guess_count, :robot, :endgame
  attr_accessor :guess_storage, :ai

  def initialize(ai)
    @ai = ai
    @name = Responses.name
    @guess_count = 0
    @robot ||= AI.new
    @endgame ||= Endgame.new
  end

  def the_mind(guess, key)
    @guess_count += 1
    if guess.chars.all? { |guess_ltr| key.include?(guess_ltr)}
      guessing_engine(guess, key)
    elsif guess.chars.any? { |guess_ltr| key.include?(guess_ltr)}
      guessing_engine(guess, key)
    else
      puts "You don't have any of the correct characters"
    end
  end

  def ai_guessing_engine(key, name)
    robot.ai_correct_positions(key)
    if robot.ai_guesses[-1].compact.count == 4
      puts robot.what_the_ai_scored(key)
      endgame.robot_overlord(name)
    else
      puts robot.what_the_ai_scored(key)
    end
  end

  def correct_guesses(guess, key)
    key.chars.count { |key_letter| guess.slice!(key_letter) if guess.include?(key_letter) }
  end

  def correct_positions(guess, key)
    (0..3).count { |num| guess[num] == key[num] }
  end

  def guessing_engine(guess, key)
    z = guess.dup
    y = correct_positions(guess, key)
    x = correct_guesses(guess, key)
    if x == 4 && y == 4
      endgame.endgame_prompt(key, name, guess_count)
    else
      puts endgame.number_scoring(z, x, y, ai)
      if ai
        ai_guessing_engine(key, name)
      end
    end
  end

end
