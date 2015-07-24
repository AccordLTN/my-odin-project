module Hangman
  class Word
    attr_accessor :value, :progress

    # Initialize with a given word or with a dictionary word if one isn't supplied.
    def initialize(word = dictionary_word)
      @value = word.upcase.split("")
      @progress = word.gsub(/\w/,"_").split("")
      @bad_guesses = []
    end

    private

    # Get a random word from the dictionary, between 5 and 12 chars in length
    def dictionary_word
      dict = File.readlines("./data/5desk.txt")
      word = dict[rand(dict.length)].strip while word.nil? || word.length <= 5 || word.length >= 12
      word
    end
  end
end