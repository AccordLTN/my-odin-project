require_relative "../lib/hangman.rb"

puts "Welcome to Hangman!\n\n"

keep_going = true

while keep_going
  if Hangman::Word.save_exist?
    puts "Game in progress detected.  Would you like to load it? Y/N"
    response = gets.chomp.upcase
    if response =~ /^Y/
      Hangman::Game.new(Hangman::Word.load).play
    end
  else
    puts "Would a player like to supply the word? Y/N"
    response = gets.chomp.upcase
    if response =~ /^Y/
      word = " "
      while !(word =~ /^[A-Z]+$/)
        puts "Please supply your word, alphabet only:"
        word = gets.chomp.upcase
      end
      Hangman::Game.new(Hangman::Word.new(word)).play
    else
      Hangman::Game.new.play
    end
  end
  puts "Play again?"
  response = gets.chomp.upcase
  keep_going = false if !(response =~ /^Y/)
end