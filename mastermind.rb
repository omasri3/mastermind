require_relative 'lib/secret_code'
require 'pry'
puts <<-CODE
Welcome to the Game of Mastermind! \n
In this game, you will have to guess a secret code. You have eight guesses to guess right!
The code is four colors long, and is either blue ('b'), yellow ('y'), red ('r'), or purple
('p'). The code should be input as four letters in sequence (bpyy). First choose whether you
want to create the code or guess the code. Input 'c' for create and 'g' for guess.\n
CODE

create_or_guess = gets
i = 8

if create_or_guess == 'g'
  #First generate a new object that on initialization will create a new secret code
  game_code = Secret_code.new()
  while i > 0
    puts "Guess the code! You Have #{i.to_s} guesses remaining!"
    #Then have the player guess the code
    player_guess = gets
    puts game_code.compare_to_guess(player_guess.downcase)
    if game_code.positions_right == 4
      puts "\nCongratulations! You have guessed the code correctly!"
      break
    end
    if i == 1
      puts "Sorry, you've ran out of guesses! The right code was #{game_code.code}"
    end
    i-=1
  end
else
  puts "Please create your secret code \n"
  game_code = gets
  puts "The computer will now guess"
  while i > 0
    guess = ''
    rand = Random.new
    4.times do
      code_letter = rand.rand(1..4)
      case code_letter
      when 1
        guess << 'b'
      when 2
        guess << 'y'
      when 3
        guess << 'r'
      when 4
        guess << 'p'
      end
    end
    colors_right = 0
    positions_right = 0
    for index in  0..3 do
      #binding.pry
      if guess[index] == game_code[index]
        positions_right += 1
      elsif guess.include? game_code[index]
        colors_right += 1
      end
    end
    i -= 1
    puts "The computer has guessed ##{positions_right} positions right and guessed #{colors_right} colors right
but in the wrong position! The Computer has #{i} guesses remaining\n"
  end
end