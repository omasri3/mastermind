require 'pry'

class Secret_code

  attr_reader :code, :positions_right

  def initialize()
    @code = ''
    rand = Random.new
    4.times do
      code_letter = rand.rand(1..4)
      case code_letter
      when 1
        @code << 'b'
      when 2
        @code << 'y'
      when 3
        @code << 'r'
      when 4
        @code << 'p'
      end
    end
  end

  def compare_to_guess (player_guess)
    colors_right = 0
    @positions_right = 0
    for index in  0..3 do
      #binding.pry
      if player_guess[index] == @code[index]
        @positions_right += 1
      elsif @code.include? player_guess[index]
        colors_right += 1
      end
    end
    "You have guessed ##{@positions_right} positions right and guessed #{colors_right} colors right
but in the wrong position!\n"
  end

end
