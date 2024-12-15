def check_line(nums, rules)
  for i in 1..nums.size-1
    return false if (nums[0..i-1] & rules[nums[i]]).any?
  end
  return true
end

rules = Hash.new { |h, key| h[key] = [] }
agg = 0

IO.foreach("input.txt") do |line|
  if line =~ /\|/
    nums = line.split('|')
    rules[nums[0]].push(nums[1].chomp)
  else
    nums = line.chomp.split(',')
    if check_line(nums, rules)
      agg += nums[nums.size/2].to_i
    end
  end
end

p agg