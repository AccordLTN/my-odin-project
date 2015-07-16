# I am an animu irl.
puts "Hello, World.  Here I am."
puts ""

def euler_one(goal)
	# Simple error check.
	if !goal.is_a? Numeric
		return "Error: Not a number."
	end

	sum_of_multiples = 0
	three_mults = 3
	five_mults = 5
	
	# Sum up multiples of 3 unless they are multiples of 5
	until three_mults >= goal do
		if !(three_mults%5 == 0)
			sum_of_multiples += three_mults
		end
		three_mults += 3
	end

	# Sum up multiples of 5
	until five_mults >= goal do
		sum_of_multiples += five_mults
		five_mults += 5
	end

	# Post sum of multiples, what's ruby's "return?"
	return sum_of_multiples
end

def euler_two(goal)
	# Simple error check.
	if !goal.is_a? Numeric
		return "Error: Not a number."
	end

	fibonacci_one = 1
	fibonacci_two = 2
	sum_of_evens = 2

	# Go until either fibonacci is >= goal
	until fibonacci_two >= goal || fibonacci_two >= goal do
		# If the first fib is smaller, make it the bigger
		if fibonacci_one < fibonacci_two
			fibonacci_one += fibonacci_two
			# If the new fib is even, add it to the sum
			if fibonacci_one%2 == 0
				sum_of_evens += fibonacci_one
			end
		# First fib is bigger, make the second one bigger
		else
			fibonacci_two += fibonacci_one
			# If the new fib is even, add it to the sum
			if fibonacci_two%2 == 0
				sum_of_evens += fibonacci_two
			end
		end
	end

	return sum_of_evens
end

def euler_three(goal)
	# Simple error check.
	if !goal.is_a? Numeric
		return "Error: Not a number."
	end

	largest_prime_factor = 1	# don't need this
	iterator = 2

	until iterator*iterator >= goal
		if goal % iterator == 0
			# Found a factor! Is it prime?
			is_prime = true
			iterator_two = 2
			until is_prime == false || iterator_two*iterator_two >= iterator
				if iterator % iterator_two == 0
					is_prime = false
				end
				iterator_two += 1
			end
			if is_prime
				largest_prime_factor = iterator
			end
		end
		iterator += 1
	end

	return largest_prime_factor
end


puts "Euler 1 Answer: " + euler_one(1000).to_s
puts "Euler 2 Answer: " + euler_two(4000000).to_s
puts "Euler 3 Answer: " + euler_three(600851475143).to_s





=begin
# This was a tutorial!  Hopefully it'll help me making the eulers...
class Student
  attr_accessor :first_name, :last_name, :primary_phone_number#, :favorite_number

  def introduction(target)
    puts "Hi #{target}, I'm #{first_name}!"
  end

  def favorite_number
    18
  end
end

laura = Student.new
laura.first_name = "Laura"
# laura.favorite_number = 18
laura.introduction("Katrina")
puts "Laura's favorite number is #{laura.favorite_number}."
=end