require_relative 'string.rb'
module Responses

  def self.game
    Game.new
  end

  def self.non_valid_entry
    puts "That is not a correct response, please try again".red
  end

  def self.i_response
    puts "You will be presented with a series of colors. Depending on your difficulty there will be anywhere from 4-6 colors that represent 4 to 8 slots. i.e. If you choose easy there will be four colors => 'r' for red, 'g' for green, 'b' for blue, and 'y' for yellow which can then be in any order or ammount i.e rrrr or rrgg or rgby. Have fun!"
  end

  def self.guess_storage(guess)
    guess
  end

  def self.name
    @name
  end

  def self.time
    @start
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
    @name = gets.chomp.downcase.to_s.delete(' ')
    @start = Time.now
    game.play
  end

  def self.game_instructions
    r = "(r)ed".red.bold
    g = "(g)reen".green.bold
    b = "(b)lue".light_blue.bold
    y = "(y)ellow".yellow.bold
    puts "I have generated a beginner sequence with four elements made up of: #{r}, #{g}, #{b}, and #{y}. Use (q)uit at any time to end the game.
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
