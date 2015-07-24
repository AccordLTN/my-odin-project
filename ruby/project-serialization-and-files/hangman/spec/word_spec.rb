require "spec_helper"

module Hangman
  describe Word do

    context "#initialize" do
      it "is initiated with a random, lowercase word by default from a supplied dictionary" do
        cell = Word.new
        expect(cell.value.is_a? Array).to be true
      end

      it "can be initialized with a value of 'Canada'" do
        cell = Word.new("Canada")
        expect(cell.value).to eq("Canada".upcase.split"")
      end
    end

  end
end