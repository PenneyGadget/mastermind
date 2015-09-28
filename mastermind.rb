class Game
  @@guess_count = 0
  @@start_time = 0
  @@end_time = 0
  def initialize
    @sequence = generate_sequence
  end

  def sequence
    @sequence
  end

  def generate_sequence
    colors = ["r", "g", "b", "y"]
    4.times.map do
      colors[rand(4)]
    end
  end

  def user_choice
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @reply = gets.chomp.downcase
  end

  def instructions
    puts "I am going to generate a secret sequence comprised of 4 colors: red, green, blue, and yellow."
    puts "Your job is to guess the sequence of these 4 colors in as few tries as possible. Good luck!"
  end

  def game_time
    @game_time = (@@end_time - @@start_time).round
  end

  def game_play
    @@start_time = Time.now
    @answer = generate_sequence
    puts "I have generated a beginner sequence with four elements made up of: "
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow."
    puts "Use (q)uit at any time to end the game and (c)heat to be a cheater."
    puts "What's your guess?"
    @guess = gets.chomp.downcase.chars
    loop do
      if @guess.first == "q" # user can type ANY word that begins with "q" and quit - not sure how to fix that
        quit
      elsif @guess.first == "c"
        cheat
      elsif @guess.length != 4
        puts "Your guess is the wrong length. Try again."
        @guess = gets.chomp.downcase.chars
      elsif @guess != @answer
        @@guess_count += 1
        correct_colors = red_correct.to_i + green_correct.to_i + blue_correct.to_i + yellow_correct.to_i
        puts "You got " + pluralize(correct_colors, 'color') + " correct and " + pluralize(correct_locations, "is", "are") + " in the correct location. You have taken #{@@guess_count} guess(es). Try again."
        @guess = gets.chomp.downcase.chars
      else
        @@guess_count += 1
        @@end_time = Time.now
        puts "Congratulations! You win!! You guessed the sequence #{@answer.join.upcase} in #{@@guess_count} guesses and it took you #{game_time} seconds."
        break
      end
    end
  end

  def pluralize(n, singular, plural=nil)
      if n == 1
          "1 #{singular}"
      elsif plural
          "#{n} #{plural}"
      else
          "#{n} #{singular}s"
      end
  end

  def correct_locations
    total = 0
    4.times do |index|
      if @guess[index] == @answer[index]
        total += 1
      end
    end
    total
  end

 #  def evaluate_guess
 #    color = 0
 #    position = 0
 #    result = []
 #    @guess.each_with_index do |color, index|
 #     if color == @guess[index]
 #       color += 1
 #       position += 1
 #       result << "You got "
 #     end
 #   end
 #   result[result.length - 1]
 # end


  def red_correct
    if @guess.grep("r").size == 0 && @answer.grep("r").size == 0
      total = 0
    elsif @guess.grep("r").size == 1 && @answer.grep("r").size == 0
      total = 0
    elsif @guess.grep("r").size == 2 && @answer.grep("r").size == 0
      total = 0
    elsif @guess.grep("r").size == 3 && @answer.grep("r").size == 0
      total = 0
    elsif @guess.grep("r").size == 4 && @answer.grep("r").size == 0
      total = 0
    elsif @guess.grep("r").size == 0 && @answer.grep("r").size == 1
      total = 0
    elsif @guess.grep("r").size == 1 && @answer.grep("r").size == 1
      total = 1
    elsif @guess.grep("r").size == 2 && @answer.grep("r").size == 1
      total = 1
    elsif @guess.grep("r").size == 3 && @answer.grep("r").size == 1
      total = 1
    elsif @guess.grep("r").size == 4 && @answer.grep("r").size == 1
      total = 1
    elsif @guess.grep("r").size == 0 && @answer.grep("r").size == 2
      total = 0
    elsif @guess.grep("r").size == 1 && @answer.grep("r").size == 2
      total = 1
    elsif @guess.grep("r").size == 2 && @answer.grep("r").size == 2
      total = 2
    elsif @guess.grep("r").size == 3 && @answer.grep("r").size == 2
      total = 2
    elsif @guess.grep("r").size == 4 && @answer.grep("r").size == 2
      total = 2
    elsif @guess.grep("r").size == 0 && @answer.grep("r").size == 3
      total = 0
    elsif @guess.grep("r").size == 1 && @answer.grep("r").size == 3
      total = 1
    elsif @guess.grep("r").size == 2 && @answer.grep("r").size == 3
      total = 2
    elsif @guess.grep("r").size == 3 && @answer.grep("r").size == 3
      total = 3
    elsif @guess.grep("r").size == 4 && @answer.grep("r").size == 3
      total = 3
    elsif @guess.grep("r").size == 0 && @answer.grep("r").size == 4
      total = 0
    elsif @guess.grep("r").size == 1 && @answer.grep("r").size == 4
      total = 1
    elsif @guess.grep("r").size == 2 && @answer.grep("r").size == 4
      total = 2
    elsif @guess.grep("r").size == 3 && @answer.grep("r").size == 4
      total = 3
    else @guess.grep("r").size == 4 && @answer.grep("r").size == 4
      total = 4
    end
  end

  def green_correct
    if @guess.grep("g").size == 0 && @answer.grep("g").size == 0
      total = 0
    elsif @guess.grep("g").size == 1 && @answer.grep("g").size == 0
      total = 0
    elsif @guess.grep("g").size == 2 && @answer.grep("g").size == 0
      total = 0
    elsif @guess.grep("g").size == 3 && @answer.grep("g").size == 0
      total = 0
    elsif @guess.grep("g").size == 4 && @answer.grep("g").size == 0
      total = 0
    elsif @guess.grep("g").size == 0 && @answer.grep("g").size == 1
      total = 0
    elsif @guess.grep("g").size == 1 && @answer.grep("g").size == 1
      total = 1
    elsif @guess.grep("g").size == 2 && @answer.grep("g").size == 1
      total = 1
    elsif @guess.grep("g").size == 3 && @answer.grep("g").size == 1
      total = 1
    elsif @guess.grep("g").size == 4 && @answer.grep("g").size == 1
      total = 1
    elsif @guess.grep("g").size == 0 && @answer.grep("g").size == 2
      total = 0
    elsif @guess.grep("g").size == 1 && @answer.grep("g").size == 2
      total = 1
    elsif @guess.grep("g").size == 2 && @answer.grep("g").size == 2
      total = 2
    elsif @guess.grep("g").size == 3 && @answer.grep("g").size == 2
      total = 2
    elsif @guess.grep("g").size == 4 && @answer.grep("g").size == 2
      total = 2
    elsif @guess.grep("g").size == 0 && @answer.grep("g").size == 3
      total = 0
    elsif @guess.grep("g").size == 1 && @answer.grep("g").size == 3
      total = 1
    elsif @guess.grep("g").size == 2 && @answer.grep("g").size == 3
      total = 2
    elsif @guess.grep("g").size == 3 && @answer.grep("g").size == 3
      total = 3
    elsif @guess.grep("g").size == 4 && @answer.grep("g").size == 3
      total = 3
    elsif @guess.grep("g").size == 0 && @answer.grep("g").size == 4
      total = 0
    elsif @guess.grep("g").size == 1 && @answer.grep("g").size == 4
      total = 1
    elsif @guess.grep("g").size == 2 && @answer.grep("g").size == 4
      total = 2
    elsif @guess.grep("g").size == 3 && @answer.grep("g").size == 4
      total = 3
    else @guess.grep("g").size == 4 && @answer.grep("g").size == 4
      total = 4
    end
  end

  def blue_correct
    if @guess.grep("b").size == 0 && @answer.grep("b").size == 0
      total = 0
    elsif @guess.grep("b").size == 1 && @answer.grep("b").size == 0
      total = 0
    elsif @guess.grep("b").size == 2 && @answer.grep("b").size == 0
      total = 0
    elsif @guess.grep("b").size == 3 && @answer.grep("b").size == 0
      total = 0
    elsif @guess.grep("b").size == 4 && @answer.grep("b").size == 0
      total = 0
    elsif @guess.grep("b").size == 0 && @answer.grep("b").size == 1
      total = 0
    elsif @guess.grep("b").size == 1 && @answer.grep("b").size == 1
      total = 1
    elsif @guess.grep("b").size == 2 && @answer.grep("b").size == 1
      total = 1
    elsif @guess.grep("b").size == 3 && @answer.grep("b").size == 1
      total = 1
    elsif @guess.grep("b").size == 4 && @answer.grep("b").size == 1
      total = 1
    elsif @guess.grep("b").size == 0 && @answer.grep("b").size == 2
      total = 0
    elsif @guess.grep("b").size == 1 && @answer.grep("b").size == 2
      total = 1
    elsif @guess.grep("b").size == 2 && @answer.grep("b").size == 2
      total = 2
    elsif @guess.grep("b").size == 3 && @answer.grep("b").size == 2
      total = 2
    elsif @guess.grep("b").size == 4 && @answer.grep("b").size == 2
      total = 2
    elsif @guess.grep("b").size == 0 && @answer.grep("b").size == 3
      total = 0
    elsif @guess.grep("b").size == 1 && @answer.grep("b").size == 3
      total = 1
    elsif @guess.grep("b").size == 2 && @answer.grep("b").size == 3
      total = 2
    elsif @guess.grep("b").size == 3 && @answer.grep("b").size == 3
      total = 3
    elsif @guess.grep("b").size == 4 && @answer.grep("b").size == 3
      total = 3
    elsif @guess.grep("b").size == 0 && @answer.grep("b").size == 4
      total = 0
    elsif @guess.grep("b").size == 1 && @answer.grep("b").size == 4
      total = 1
    elsif @guess.grep("b").size == 2 && @answer.grep("b").size == 4
      total = 2
    elsif @guess.grep("b").size == 3 && @answer.grep("b").size == 4
      total = 3
    else @guess.grep("b").size == 4 && @answer.grep("b").size == 4
      total = 4
    end
  end

  def yellow_correct
    if @guess.grep("y").size == 0 && @answer.grep("y").size == 0
      total = 0
    elsif @guess.grep("y").size == 1 && @answer.grep("y").size == 0
      total = 0
    elsif @guess.grep("y").size == 2 && @answer.grep("y").size == 0
      total = 0
    elsif @guess.grep("y").size == 3 && @answer.grep("y").size == 0
      total = 0
    elsif @guess.grep("y").size == 4 && @answer.grep("y").size == 0
      total = 0
    elsif @guess.grep("y").size == 0 && @answer.grep("y").size == 1
      total = 0
    elsif @guess.grep("y").size == 1 && @answer.grep("y").size == 1
      total = 1
    elsif @guess.grep("y").size == 2 && @answer.grep("y").size == 1
      total = 1
    elsif @guess.grep("y").size == 3 && @answer.grep("y").size == 1
      total = 1
    elsif @guess.grep("y").size == 4 && @answer.grep("y").size == 1
      total = 1
    elsif @guess.grep("y").size == 0 && @answer.grep("y").size == 2
      total = 0
    elsif @guess.grep("y").size == 1 && @answer.grep("y").size == 2
      total = 1
    elsif @guess.grep("y").size == 2 && @answer.grep("y").size == 2
      total = 2
    elsif @guess.grep("y").size == 3 && @answer.grep("y").size == 2
      total = 2
    elsif @guess.grep("y").size == 4 && @answer.grep("y").size == 2
      total = 2
    elsif @guess.grep("y").size == 0 && @answer.grep("y").size == 3
      total = 0
    elsif @guess.grep("y").size == 1 && @answer.grep("y").size == 3
      total = 1
    elsif @guess.grep("y").size == 2 && @answer.grep("y").size == 3
      total = 2
    elsif @guess.grep("y").size == 3 && @answer.grep("y").size == 3
      total = 3
    elsif @guess.grep("y").size == 4 && @answer.grep("y").size == 3
      total = 3
    elsif @guess.grep("y").size == 0 && @answer.grep("y").size == 4
      total = 0
    elsif @guess.grep("y").size == 1 && @answer.grep("y").size == 4
      total = 1
    elsif @guess.grep("y").size == 2 && @answer.grep("y").size == 4
      total = 2
    elsif @guess.grep("y").size == 3 && @answer.grep("y").size == 4
      total = 3
    else @guess.grep("y").size == 4 && @answer.grep("y").size == 4
      total = 4
    end
  end

  def cheat
    puts "Here you go, cheater: #{@answer.join.upcase}"
    @guess = gets.chomp.downcase.chars
 end

  def quit
    puts "Quitter. Goodbye!"
    exit
  end

end

game = Game.new
puts "Welcome to MASTERMIND!"
gameplay = game.user_choice

while !(gameplay == "q" || gameplay == "quit")

  if gameplay == "i" || gameplay == "instructions"
    game.instructions
  else gameplay == "p" || gameplay == "play"
    game.game_play
  end

gameplay = game.user_choice
end
game.quit


# I'm sure this isn't in the proper order - what is a basic proper order for something like this?
