module Hangman
  class Game
    attr_reader :word

    # Either takes a Word-like object as a param, loads from the save file,
    # or generates a new one.
    def initialize(word = nil)
      word.nil? ? @word = nil : @word = word
      if @word.nil? && Word.save_exist?
        puts "Game in progress detected.  Would you like to load it? Y/N"
        purr = gets.chomp
        @word = Word.load if purr =~ /$[Yy]/
      end
      @word = Word.new if @word.nil?
    end

    def display_progress
      puts @word.progress.join(" ")
    end
  end
end

k = Hangman::Game.new

#puts k.word.value.join("")