arr = []

IO.foreach("input.txt") do |line|
  arr.push(line.chomp)
end

def check(arr, x, y)
  width = arr.size
  height = arr[0].size

  return 0 if x+1 > width-1 || y+1 > height-1 || x-1 < 0 || y-1 < 0
  
  back_slash = arr[x+1][y+1] + arr[x-1][y-1]
  forward_slash = arr[x-1][y+1] + arr[x+1][y-1]

  if (back_slash == 'MS' || back_slash == 'SM') && (forward_slash == 'MS' || forward_slash == 'SM')
    return 1
  else
    return 0
  end
end

matches = 0

arr.each_with_index do |row, x|
  row.chars.each_with_index do |char, y|
    if char == 'A'
      matches += check(arr, x, y)
    end
  end
end

puts matches