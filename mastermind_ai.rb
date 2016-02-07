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
    new_guess = ai_guesses[-1].map { |guess_ltr| guess_ltr.nil? ? 'rgby'.chars.sample : guess_ltr }

    @guesses_to_analyze << new_guess
    new_guess
  end

  def ai_correct_positions(key)
    ai_guess = ai_re_guesser
    ai_array_with_correct= [nil,nil,nil,nil]
    ai_guess.each_with_index { |guess_ltr, index|
                    (ai_array_with_correct.slice!(index)
                    ai_array_with_correct.insert(index, guess_ltr)) if ai_guess[index] == key[index] }
    @ai_guesses << ai_array_with_correct
  end

end
