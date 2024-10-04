class GamePossible
  attr_reader :id_counter,
              :file_content
  def initialize
    @id_counter = 0
    @file_content = File.read(File.join(__dir__, "../input.txt")).split("\n")
    @compare = { "red" => 12, "green" => 13, "blue" => 14}
  end

  def possible
    split_by_colon = @file_content.map do |line|
       line.split(/[:;]/)
    end
    split_by_colon
  end
  

  def add_ids
    games = possible

    games.each do |game|
      game_id = game[0].scan(/\d+/).first.to_i 
      valid_game = true

      game[1..-1].each do |round|
        round.split(",").each do |color_info|

          number, color = color_info.strip.split(" ")
          number = number.to_i

          if @compare[color] && number > @compare[color]
            valid_game = false
            break 
          end

        end
        break unless valid_game 
      end

      if valid_game
        @id_counter += game_id
      end

    end
    @id_counter
  end
  
end

game = GamePossible.new
puts game.add_ids