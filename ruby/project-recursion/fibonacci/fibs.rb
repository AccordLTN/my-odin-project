def fibs(num, x = 0, y = 1, fibs_array = [])
  num.times do x > y ? fibs_array << y += x : fibs_array << x += y end
  fibs_array
end

puts fibs(10).to_s
puts fibs(1).to_s
puts fibs(0).to_s

def fibs_rec(num, x = 0, y = 1, fibs_array = [])
  return fibs_array if num == 0
  x > y ? fibs_rec(num - 1, x, y+x, fibs_array << x+y) : fibs_rec(num - 1, x+y, y, fibs_array << x+y)
end

puts fibs_rec(10).to_s
puts fibs_rec(1).to_s
puts fibs_rec(0).to_s