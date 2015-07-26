require "yaml"

module Hangman
  class Word
    attr_accessor :value, :progress, :bad_guesses

    # Initialize with a given word or with a dictionary word if one isn't supplied.
    def initialize(word = dictionary_word, progress = nil, bad_guesses = [])
      word = word.join("") if word.is_a? Array
      @value = word.upcase.split("")
      progress.nil? ? @progress = word.upcase.gsub(/\w/,"_").split("") : @progress = progress.join("").upcase.split("")
      @bad_guesses = bad_guesses.join("").upcase.split("")
    end

    # Used for both save and load
    SaveLocation = "data/save.txt"

    # Save Word values to a txt file
    def save
      File.open(SaveLocation, 'w') do |file|
        file.puts @value.join("")
        file.puts @progress.join("")
        file.puts @bad_guesses.join("")
      end
    end

    # Load Word values from a txt file
    def load
      loaded = File.readlines(SaveLocation)
      @value = loaded[0].upcase.split("")
      @progress = loaded[1].upcase.split("")
      @bad_guesses = loaded[2].upcase.split("")
    end

    def delete
      File.delete(SaveLocation)
    end

    def save_exist?
      File.file?(SaveLocation)
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

# k = Hangman::Word.new()

# puts k.value.join(" ")
# puts k.progress.join(" ")
# puts k.bad_guesses.join(" ")

# f = Hangman::Word.new("Canada")

# puts f.value.join(" ")
# puts f.progress.join(" ")
# puts f.bad_guesses.join(" ")

g = Hangman::Word.new(["c","a","n","a","d","a"],["_","_","n","_","_","_"],["k"])

puts g.value.join(" ")
puts g.progress.join(" ")
puts g.bad_guesses.join(" ")

g.save
puts ""
g.load

puts g.value.join(" ")
puts g.progress.join(" ")
puts g.bad_guesses.join(" ")

puts g.save_exist?.to_s
g.delete
puts g.save_exist?.to_s