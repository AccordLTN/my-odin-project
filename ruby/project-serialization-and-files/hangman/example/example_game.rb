require_relative "../lib/hangman.rb"

puts "Welcome to Hangman!"
puts ""
# If savegame detected
# puts "Incomplete game detected.  Would you like to continue? Y/N"
# Hangman::Game.new(Hangman::Save.load)
# Else
Hangman::Game.new()



# puts "Would a player like to supply the word or will a random one be chosen? Y/N"
# response = gets.chomp
# if response == "Y" || response == "Yes"
#   word = " "
#   while !(word =~ /$\w*^/)
#     puts "Please supply your word, no special characters, no spaces:"
#     word = gets.chomp
#     Hangman::Game.new(word)
#   end
# else

# end