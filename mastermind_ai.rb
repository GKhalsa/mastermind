require 'pry'
class AI
  attr_reader :temp

  def initialize
    @temp ||= [[nil,nil,nil,nil]] #["a", nil, nil, "b"]
    @guess_count = 0
  end



  # def correct_guesses(guess, key)
  #   key.chars.count { |key_letter| guess.slice!(key_letter) if guess.include?(key_letter) }
  # end

  def what_the_ai_scored
    x = temp[-1].compact.length
    "The computer has #{x} of the correct elements, with #{x} in the correct position"
  end

  def ai_re_guesser
    @guess_count +=1
    old_guess = temp[-1]
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
  def ai_correct_positions(key)
    ai_guess = ai_re_guesser    #aa     #za
    ai_array_with_correct= [nil,nil,nil,nil]
    ai_guess.each_with_index do |guess_ltr, index|
      if ai_guess[index] == key[index]
        ai_array_with_correct.slice!(index)
        ai_array_with_correct.insert(index, guess_ltr)
      end
    end
    @temp << ai_array_with_correct
  end

end
AI.new.ai_correct_positions('rgby') # => [[nil, nil, nil, nil], [nil, nil, "b", "y"]]


#random guess is generated
#guess is analyzed for correct guesses and correct positions
#maybe only correct positions because both might make ai too hard
#so
#if ai guess hits correct positions, it locks that index in place with that guess and no longer generates 4 guesses, but instead 3 guesses with that matched index permenently occupied. number of 4.times do will be variable x.times do
#pushes guess to array or hash(probably hash), hash then gets called by key to

#searches the guess, see if each of the guess elements are included in the key if guess.count(letter) <= key.count(letter)
