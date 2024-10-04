class GamePossible
  attr_reader :id_counter,
              :file_content
  def initialize
    @id_counter = 0
    @file_content = File.read(File.join(__dir__, "../input.txt")).split("\n")
  end

  def possible
    @file_content.map do |line|
      split_array = line.split(/[:,;]/)
      split_array.select do |a|
        temp_id = split_array[0].chars.select { |c| c.match?(/[[:digit:]]/) }.first
        require 'pry'; binding.pry

      end
    end
  end


end
# 12 red cubes
# 13 green cubes
# 14 blue cubes

game = GamePossible.new
puts game.possible