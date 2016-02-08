class Writing
  def self.writer(name)
      File.open("leaderboard.txt", 'a') { |file| file.write "#{name}" }
  end
end
