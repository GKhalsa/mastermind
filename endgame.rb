require_relative 'responses.rb'
require_relative 'string.rb'

class Endgame
  attr_reader :robot
  def initialize
  end

  def endgame_prompt(key, name, guess_count)
    final = (Time.now - Responses.time).to_i.divmod 60
    puts "Congratulations #{name}! You guessed the sequence #{key.upcase} in #{guess_count} guesses over #{final[0]} minutes, #{final[1]} seconds "
    replay_prompt
  end

  def replay_prompt
    puts "\nDo you want to (p)lay again or (q)uit?"
    result = gets.chomp.downcase.delete(' ')
    endgame(result)
  end

  def endgame(result)
    if result == 'p'
      Responses.gameplay
    elsif result == 'q'
      throw :done
    end
  end

  def number_scoring(z, x, y, ai)
    puts "#{z} has #{x} of the correct elements, with #{y} in the correct position".magenta
  end

  def robot_overlord(name)
    puts "Robot Wins!!"
    puts "Silly #{name}, you think you were a match for me?! It's ok though, you were fun to play with, I will spare you during the robot uprising".red.bold
    replay_prompt
  end
end
