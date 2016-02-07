require_relative 'responses.rb'
require_relative 'game.rb'

class Guesser
  include Responses
  attr_reader :name, :guess_count
  attr_accessor :guess_storage, :ai

  def initialize(ai)
    @ai = ai
    @name = Responses.name
    @guess_count = 0
  end

  def the_mind(guess, key)
    @guess_count += 1
    # GuessStorage.new.guess_collection << guess
    if guess.chars.all? { |guess_ltr| key.include?(guess_ltr)}
      guessing_engine(guess, key)
    elsif guess.chars.any? { |guess_ltr| key.include?(guess_ltr)}
      guessing_engine(guess, key)
    else
      puts "You don't have any of the correct characters"
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
      Endgame.new.endgame_prompt(key, name, guess_count)
    else
      Endgame.new.number_scoring(z, x, y, ai)
    end
  end

end

class Endgame
  attr_reader :robot
  def initialize
    @robot ||= AI.new
  end

  def endgame_prompt(key, name, guess_count)
    final = (Time.now - Responses.time).to_i.divmod 60
    puts "Congratulations #{name}! You guessed the sequence #{key.upcase} in #{guess_count} guesses over #{final[0]} minutes, #{final[1]} seconds "
    puts "Do you want to (p)lay again or (q)uit?"
    result = gets.chomp.downcase.to_s
    endgame(result)
  end

  def endgame_prompt_(result)
    if result == 'p'
      Responses.gameplay
    elsif result == 'q'
      throw :done
    end
  end

  def number_scoring(z, x, y, ai)
    if ai
      robot.what_the_ai_scored
    else
      puts "#{z} has #{x} of the correct elements, with #{y} in the correct position"
    end
  end

  def endgame(result)
    if result == 'p'
      Responses.gameplay
    elsif result == 'q'
      throw :done
    end
  end
end

class GuessStorage
   def initialize
   end
end
