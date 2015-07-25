require "spec_helper"

module Hangman
  describe Word do

    context "#initialize" do
      it "is initiated with a random, lowercase word by default from a supplied dictionary" do
        word = Word.new
        expect(word.value.is_a? Array).to be true
        expect(word.value.length).to eq word.progress.length
      end

      it "can be initialized with a value of 'Canada'" do
        word = Word.new("Canada")
        expect(word.value).to eq("Canada".upcase.split"")
        expect(word.value.length).to eq(word.progress.length)
      end

      it "can be initialized with all three of its parameters" do
        word  = Word.new("canada",["_","_","n","_","_","_"],["k"])
        expect(word.value).to eq(["C","A","N","A","D","A"])
        expect(word.value.length).to eq(word.progress.length)
      end

      it "can be initialized with all three of its parameters even if value is an array" do
        word = Word.new(["c","a","n","a","d","a"],["_","_","n","_","_","_"],["k"])
        expect(word.value).to eq(["C","A","N","A","D","A"])
        expect(word.value.length).to eq(word.progress.length)
      end
    end

  end
end