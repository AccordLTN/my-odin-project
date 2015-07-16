def echo(text)
	return text
end


def shout(text)
	return text.upcase
end

def repeat(text, repeat_num=2)
	new_text = text
	while repeat_num-1 > 0 do
		new_text += " " + text
		repeat_num -= 1
	end
	return new_text
end

def start_of_word(text, number_of_letters)
	return text.slice(0..number_of_letters-1)
end

def first_word(text)
	return text.split[0]
end


# no little words except if first
def titleize(text)
	# If just one word
	if !text.match(" ")
		return text.capitalize
	end

	# Split into separate words, capitalize the first
	text = text.split(" ")
	text[0] = text[0].capitalize

	# Iterator starts at 1 because first word is capitalized
	iterator = 1
	while iterator < text.length do
		if text[iterator] == "and" || text[iterator] == "the" || text[iterator] == "over"
		else
			text[iterator] = text[iterator].capitalize
		end
		iterator += 1
	end
	return text.join(" ")
end