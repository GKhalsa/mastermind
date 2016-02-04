module Responses

  def self.game
    Game.new
  end

  def self.non_valid_entry
    puts "That is not a correct response, please try again"
  end

  def self.i_response
    puts "There is a generated key, you have to guess it. Use (q)uit at any time to end the game. add more to this later!!"
  end

  def self.name
    @name
  end

  def self.keygen
    key = []
    4.times do
      key << 'rgby'.chars.sample
    end
    key
  end

  def self.gameplay
    puts "what is your name?"
    @name = gets.chomp.downcase.to_s
    game.play
  end

  def self.game_instructions
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def self.over_under(guess)
    if guess.length < 4
      puts "You didn't include enough characters"
    else guess.length > 4
      puts "You put too many characters"
    end
  end

  def self.is_i?(guess)
    x = guess.chars.any? do |d|
     !(d =~ /[[:alpha:]]/)
    end
    puts 'no numbers or special characters' if x
  end

end
