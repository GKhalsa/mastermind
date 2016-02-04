module Responses

  def self.non_valid_entry
    puts "That is not a correct response, please try again"
  end

  def self.i_response
    puts "There is a generated key, you have to guess it. Use (q)uit at any time to end the game. add more to this later!!"
  end

  def self.keygen
    key = []
    4.times do
      key << 'rgby'.chars.sample
    end
    key
  end
end
