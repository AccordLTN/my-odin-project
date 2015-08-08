def merge(f_half, s_half)
  return f_half if s_half.empty?
  return s_half if f_half.empty?
  f_half[0] < s_half[0] ? [f_half[0]] + merge(f_half[1..-1],s_half) : [s_half[0]] + merge(f_half,s_half[1..-1])
end

def merge_sort(sort_array)
  return sort_array if sort_array.length < 2
  half = sort_array.length / 2
  merge(merge_sort(sort_array[0...half]), merge_sort(sort_array[half..-1]))
end

array = [-45, 23, -3, 83, 37, 64, -12, 54, -27, 100]

puts merge_sort(array).to_s