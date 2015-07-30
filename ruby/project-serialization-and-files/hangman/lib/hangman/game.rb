module Hangman
  class Game
    attr_reader :word

    # Either takes a Word-like object as a param, loads from the save file,
    # or generates a new one.
    def initialize(word = nil)
      word.nil? ? @word = nil : @word = word
      if @word.nil? && Word.save_exist?
        puts "Game in progress detected.  Would you like to load it? Y/N"
        response = gets.chomp.upcase
        @word = Word.load if response =~ /^[Y]/
      end
      @word = Word.new if @word.nil?
    end

    # Game loop.
    def play
      while !victory? && @word.bad_guesses.length < 6
        display_progress
        input = get_input
        break if input == false
        check(input)
        @word.save if @word.bad_guesses.length < 6
      end
      puts "\n\n#{@word.value.join.capitalize}! You win!\n\n" if victory?
      puts "\n\nYou lose!  The word was #{@word.value.join.capitalize}.\n\n" if @word.bad_guesses.length > 5
      Hangman::Word.delete if victory? || @word.bad_guesses.length > 5
    end

    def display_progress
      puts "\n\n" + @word.progress.join(" ").upcase + "\n\n\n"
      puts "Misses: " + @word.bad_guesses.join(" ").upcase
      puts (5 - @word.bad_guesses.length).to_s + " misses left."
    end

    # Checks the word for a guess, updating progress and bad_guesses accordingly.
    def check(char)
      found = false
      @word.value.each_with_index do |val, index|
        if val == char.upcase
          @word.progress[index] = char.upcase
          found = true
        end
      end
      return if @word.bad_guesses.include?(char)
      puts "Bad guess!" unless found
      @word.bad_guesses << char.upcase unless found
    end

    def get_input
      loop do
        print "Next guess, or quit: "
        guess = gets.chomp.upcase
        if guess == "QUIT"
          puts "Thanks for playing!"
          return false
        elsif !(guess =~ /^[A-Z]$/)
          puts "One character, A-Z, please."
        else
          return guess
        end
      end
    end

    # Returns true if the game has been beaten.
    def victory?
      !@word.progress.include?("_")
    end
  end
end