require 'pry'

# def hello
#   response = gets.chomp
#   puts response
# end
# def hello
#   puts 'say something'
#   response = gets.chomp
#   if response == 'h' || 'p'
#     puts 'hello'
#   elsif response == 'a' || 'z'
#     puts 'nolo'
#   end
# end

# def keygen
#   key = []
#   4.times do
#     key << 'rgby'.chars.sample
#   end
#   binding.pry
#   puts key
# end
  # def alll
  #   key = 'hello'
  #   guess = 'hello'.chars
  #   guess.all? do |letter|
  #     key.include?(letter)
  #   end
  # end

  def beiberize
    array = ["taylor swift", "selena gomez", "justin beiber"]
    array.each do |full_name|
      first = full_name.split.first
      if first.include?("selena")
        p first + " <3 #{array[2].split.first} ~forever~"
      end
    end
  end
beiberize
