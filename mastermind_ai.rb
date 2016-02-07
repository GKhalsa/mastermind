require 'pry'
class AI
  attr_reader :ai_guesses, :guesses_to_analyze

  def initialize
    @ai_guesses ||= [[nil,nil,nil,nil]]
    @guesses_to_analyze = []
  end

  def correct_elements(guesses_to_analyze, key)
    g = guesses_to_analyze[-1].join
    key.chars.count { |key_letter| g.slice!(key_letter) if g.include?(key_letter) }
  end

  def what_the_ai_scored(key)
    x = ai_guesses[-1].compact.length
    y = correct_elements(guesses_to_analyze, key)
    "The computer has #{y} of the correct elements, with #{x} in the correct position"
  end

  def ai_re_guesser
    old_guess = ai_guesses[-1]
    new_guess = []
    old_guess.each do |guess_ltr|
      if guess_ltr.nil?
        new_guess << 'rgby'.chars.sample
      else
        new_guess << guess_ltr
      end
    end
    @guesses_to_analyze << new_guess
    new_guess
  end
                         
  def ai_correct_positions(key)
    ai_guess = ai_re_guesser
    ai_array_with_correct= [nil,nil,nil,nil]
    ai_guess.each_with_index do |guess_ltr, index|
      if ai_guess[index] == key[index]
        ai_array_with_correct.slice!(index)
        ai_array_with_correct.insert(index, guess_ltr)
      end
    end
    @ai_guesses << ai_array_with_correct
  end

end



#in the key if guess.count(letter) <= key.count(letter)
#once all four it guesses through those randomly or mayb 3 whatever makes more sense
