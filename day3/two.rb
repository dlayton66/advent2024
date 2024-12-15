agg = 0
active = true

IO.foreach("input.txt") do |line|
  full_regex = /mul\(\d{1,3},\d{1,3}\)|don't\(\)|do\(\)/
  matches = line.scan(full_regex)

  matches.each do |match|
    if match == "don't()"
      active = false
    elsif match == "do()"
      active = true
    elsif active
      nums = match.scan(/(\d{1,3}),(\d{1,3})/)
      agg += nums.flatten.map(&:to_i).reduce(:*)
    end
  end
end

puts agg