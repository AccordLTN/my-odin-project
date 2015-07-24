require_relative "./event_manager/version"

require "csv"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

puts "EventManager initialized."

contents = CSV.open "./data/event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  puts "#{name} #{zipcode}"
end


# lines = (File.read "./data/event_attendees.csv").split("\n")
# lines.each_with_index do |line, index|
#   next if index == 0
#   columns = line.split(",")
#   name = columns[2].capitalize
#   puts name
# end


# def clean_zipcode(zipcode)
#   return zipcode = "00000" if zipcode.nil?
#   return zipcode.slice(0..4) if zipcode.length > 5
#   zipcode.insert(0,"0") while zipcode.length < 5
#   zipcode
# end