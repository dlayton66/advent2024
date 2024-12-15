arr_1 = []
arr_2 = []

File.open("input.txt", "r") do |file|
  delimiter = "   "
  file.each_line do |line|
    index = line.index(delimiter)
    num_one = line[0...index].to_i
    num_two = line[index+3..].to_i
    arr_1.push(num_one)
    arr_2.push(num_two)
  end
end

arr_1.sort!
arr_2.sort!

agg = 0

for i in 0..arr_1.size-1
  difference = arr_1[i] - arr_2[i]
  agg += difference.abs
end

puts agg