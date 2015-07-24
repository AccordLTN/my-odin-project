require_relative "./event_manager/version"

require "csv"

puts "EventManager initialized."

lines = (File.read "./data/event_attendees.csv").split("\n")
lines.each_with_index do |line, index|
  next if index == 0
  columns = line.split(",")
  name = columns[2].capitalize
  puts name
end