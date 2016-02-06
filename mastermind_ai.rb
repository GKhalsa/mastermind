class AI
  attr_reader :temp
  def initialize
    @temp = [["a", nil, nil, "b"]]
  end

  def random_guess(nums_left_to_guess = 4, key)
    ai_guess = ""
    nums_left_to_guess.times do
      key << 'rgby'.chars.sample
    end
    ai_analyzer(ai_guess, key)
  end

  # def ai_analyzer(ai_guess, key)
  # @temp << correct_positions(ai_guess, key)  #["a", nil, nil, "b"]
  # end

  def correct_guesses(guess, key)
    key.chars.count { |key_letter| guess.slice!(key_letter) if guess.include?(key_letter) }
  end

  def what_is_correct_ai
    x = temp[-1].compact.length
    "The computer has #{x} of the correct elements, with #{x} in the correct position"
  end

  def ai_re_guesser
    old_guess = temp[-1]  # => ["a", nil, nil, "b"]
    new_guess = []
    old_guess.each do |guess_ltr|
      if guess_ltr.nil?
        new_guess << 'rgby'.chars.sample
      else
        new_guess << guess_ltr
      end
    end
    new_guess
  end
                         #abbb  #aaab
  def correct_positions(ai_guess, key)
    ai_array_with_correct= [nil,nil,nil,nil]
    ai_guess[0].chars.each_with_index do |guess_ltr, index|
      if ai_guess[0][index] == key[index]
        ai_array_with_correct.slice!(index)
        ai_array_with_correct.insert(index, guess_ltr)
      end
    end
    @temp << ai_array_with_correct # =>
  end

end
AI.new.ai_re_guesser # => ["a", "y", "g", "b"]


#random guess is generated
#guess is analyzed for correct guesses and correct positions
#maybe only correct positions because both might make ai too hard
#so
#if ai guess hits correct positions, it locks that index in place with that guess and no longer generates 4 guesses, but instead 3 guesses with that matched index permenently occupied. number of 4.times do will be variable x.times do
#pushes guess to array or hash(probably hash), hash then gets called by key to

#searches the guess, see if each of the guess elements are included in the key if guess.count(letter) <= key.count(letter)
