require_relative "../lib/tic_tac_toe.rb"
 
puts "Welcome to tic tac toe"
laura = TicTacToe::Player.new({color: "X", name: "Laura"})
fede = TicTacToe::Player.new({color: "O", name: "Fede"})
players = [laura, fede]
TicTacToe::Game.new(players).play