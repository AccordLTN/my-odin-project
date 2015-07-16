class Book
	attr_accessor :title

	def title= (new_title)
		# If just one word
		if !new_title.match(" ")
			@title = new_title.capitalize
		end

		small_words = ["a", "an", "and", "the", "in", "of"]

		# Split into separate words, capitalize the first
		words = new_title.split(" ")
		words[0] = words[0].capitalize

		# Iterator starts at 1 because first word is capitalized
		iterator = 1
		while iterator < words.length do
			if small_words.include? words[iterator]
			else
				words[iterator] = words[iterator].capitalize
			end
			iterator += 1
		end

		@title = words.join(" ")
	end
end