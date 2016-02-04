class Guesser


  def the_mind(guess, key)
    if guess.chars.all? { |guess_ltr| key.include?(guess_ltr)}
      guessing_engine(guess, key)
    elsif guess.chars.any? { |guess_ltr| key.include?(guess_ltr)}
      guessing_engine(guess, key)
    else
      puts "You don't have any of the correct characters"
    end
  end

end
