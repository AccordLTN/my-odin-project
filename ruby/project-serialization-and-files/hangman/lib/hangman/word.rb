require "yaml"

module Hangman
  class Word
    attr_accessor :value, :progress, :bad_guesses

    # Initialize with a given word or with a dictionary word if one isn't supplied.
    def initialize(word = dictionary_word, progress = nil, bad_guesses = [])
      word = word.join("") if word.is_a? Array
      @value = word.upcase.split("")
      progress.nil? ? @progress = word.gsub(/\w/,"_").split("") : @progress = progress
      @bad_guesses = bad_guesses
    end

    private

    # Get a random word from the dictionary, between 5 and 12 chars in length
    def dictionary_word
      dict = File.readlines("./data/5desk.txt")
      word = dict[rand(dict.length)].strip while word.nil? || word.length <= 5 || word.length >= 12
      word
    end

    # Save Word values to a yaml file

    # Load Word values from a yaml file
  end
end

k = Hangman::Word.new()

puts k.value.join(" ")
puts k.progress.join(" ")
puts k.bad_guesses.join(" ")

f = Hangman::Word.new("Canada")

puts f.value.join(" ")
puts f.progress.join(" ")
puts f.bad_guesses.join(" ")

g = Hangman::Word.new(["c","a","n","a","d","a"],["_","_","n","_","_","_"],["k"])

puts g.value.join(" ")
puts g.progress.join(" ")
puts g.bad_guesses.join(" ")