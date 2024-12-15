agg = 0

IO.foreach("input.txt") do |line|
  regex = /mul\((\d{1,3}),(\d{1,3})\)/
  matches = line.scan(regex)
  
  matches.each do |x, y|
    agg += x.to_i * y.to_i
  end
end

puts agg