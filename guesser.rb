require_relative 'responses.rb'

class Guesser
  include Responses
  attr_reader :name, :guess_count
  def initialize
    @name = Responses.name
    @guess_count = 0
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

  def correct_guesses(guess, key)
    key.chars.count do |key_letter|
      if guess.include?(key_letter)
        guess.slice!(key_letter)
      end
    end
  end

  def correct_positions(guess, key)
    (0..3).count do |num|
      guess[num] == key[num]
    end
  end

  def guessing_engine(guess, key)
    y = correct_positions(guess, key)
    x = correct_guesses(guess, key)
    if x == 4 && y == 4
      endgame_prompt(key)
    else
      number_scoring(guess, x, y)
    end
  end

  def endgame_prompt(key)
    final = (Time.now - Responses.time).to_i.divmod 60
    puts "Congratulations #{name}! You guessed the sequence #{key.upcase} in #{guess_count} guesses over #{final[0]} minutes, #{final[1]} seconds "
    puts "Do you want to (p)lay again or (q)uit?"
    result = gets.chomp.downcase.to_s
    endgame(result)
  end

  def endgame(result)
    if result == 'p'
      Responses.gameplay
    elsif result == 'q'
      throw :done
    end
  end

  def number_scoring(guess, x, y)
    puts "#{guess} has #{x} of the correct elements, with #{y} in the
    correct position"
  end

end
