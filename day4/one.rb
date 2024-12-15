arr = []

IO.foreach("input.txt") do |line|
  arr.push(line.chomp)
end

def check(arr, x, y, i, j)
  width = arr.size
  height = arr[0].size

  return 0 if x+3*i > width-1 || x+3*i < 0 || y+3*j > height-1 || y+3*j < 0
  
  if arr[x+i][y+j] == 'M' && arr[x+2*i][y+2*j] == 'A' && arr[x+3*i][y+3*j] == 'S'
    return 1
  else
    return 0
  end
end

matches = 0

arr.each_with_index do |row, x|
  row.chars.each_with_index do |char, y|
    if char == 'X'
      matches += check(arr, x, y, 1, 0)
      matches += check(arr, x, y, -1, 0)
      matches += check(arr, x, y, 0, 1)
      matches += check(arr, x, y, 0, -1)
      matches += check(arr, x, y, 1, 1)
      matches += check(arr, x, y, 1, -1)
      matches += check(arr, x, y, -1, 1)
      matches += check(arr, x, y, -1, -1)
    end
  end
end

puts matches