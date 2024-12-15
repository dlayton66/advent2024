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

arr_1.each_with_index do |num_1, i|
  num_matches = arr_2.select { |num_2| num_1 == num_2 }.size
  arr_1[i] = num_1 * num_matches
end

puts arr_1.sum