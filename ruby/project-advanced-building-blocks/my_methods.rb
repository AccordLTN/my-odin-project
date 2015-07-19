#module Enumerable
  def my_each(my_array)
    i = 0
    while i < my_array.length
      yield (my_array[i])
      i += 1
      puts "#{my_array[i]}"
    end
    my_array.to_s
  end
#end

add_one = Proc.new {|x| 
  x += 1
  puts "#{x}"
}

puts my_each([1, 1, 1], &add_one)




