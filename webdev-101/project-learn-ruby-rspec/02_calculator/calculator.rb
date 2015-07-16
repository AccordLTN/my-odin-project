def add(num_one, num_two)
	return num_one + num_two
end

def subtract(num_one, num_two)
	return num_one - num_two
end

def sum(sum_array)
	iterator = 0
	total = 0

	while iterator < sum_array.length do
		total += sum_array[iterator]
		iterator += 1
	end

	return total
end

def multiply(mult_array)
	iterator = 0
	total = 1

	while iterator < mult_array.length do
		total *= mult_array[iterator]
		iterator += 1
	end

	return total
end

def power()
end

def factorial()
end