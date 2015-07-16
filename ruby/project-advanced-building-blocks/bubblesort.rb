def bubble_sort (list_array)
  loop do
    swap = 0
    list_array.each_with_index do |x, index|
      if list_array[index + 1] == nil
      elsif x > list_array[index + 1]
        swap = list_array[index]
        list_array[index] = list_array[index + 1]
        list_array[index + 1] = swap
      end
    end
    break if swap == 0
  end
  list_array.to_s
end

puts bubble_sort([4,3,78,2,0,2])

def bubble_sort_by (list_array)
  loop do
    swap = 0
    list_array.each_with_index do |x, index|
      if list_array[index + 1] == nil
      elsif yield(list_array[index],list_array[index + 1]) < 0
        swap = list_array[index]
        list_array[index] = list_array[index + 1]
        list_array[index + 1] = swap
      end
    end
    break if swap == 0
  end
  list_array.to_s
end

length_sorting = Proc.new {|left,right| right.length - left.length}
puts bubble_sort_by(["hi","hello","hey"], &length_sorting)