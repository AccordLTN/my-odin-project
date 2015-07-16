class Timer
	attr_accessor :seconds

	def initialize()
		@seconds = 0
	end

	def time_string
		return padded(@seconds / 3600) + ":" + padded((@seconds % 3600) / 60) + ":" + padded((@seconds % 3600) % 60)
	end

	def padded (num)
		if num < 10
			return "0" + num.to_s
		else
			return num.to_s
		end
	end
end