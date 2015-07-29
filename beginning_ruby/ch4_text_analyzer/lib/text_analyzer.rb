# character count

# character count, no spaces

# line count

# word count

# sentence count

# paragraph count

# average number of words per sentence

# average number of sentences per paragraph

# text=''
# line_count = 0
# File.open("data/oliver.txt").each do |line| 
#   line_count += 1 
#   text << line
# end
puts ARGV.join('-')

stop_words = %w{the a by on for of are with just but and to the my I has some in}
lines = File.readlines("data/oliver.txt")
text = lines.join
words = text.scan(/\w+/)
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)

line_count = lines.size
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length
word_count = text.split.length
paragraph_count = text.split(/\n\n/).length
sentence_count = sentences.size
keywords = words.select { |word| !stop_words.include?(word) }

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{((keywords.length.to_f / words.length.to_f) * 100).to_i}% keywords"

sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

puts "\n\n\n" + ideal_sentences.join(". ") + "."