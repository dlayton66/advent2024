def is_ordered(nums, before_rules)
  for i in 1..nums.size-1
    return false if (nums[0..i-1] & before_rules[nums[i]]).any?
  end
  return true
end

# put new number right before the lowest index before_rule
# else put new number right after the highest index after_rule
def order_nums(nums, before_rules, after_rules)
  ordered_nums = [nums.shift]
  nums.each do |num|
    lowest_index = ordered_nums.index { |ordered_num| before_rules[num].include?(ordered_num) }
    if lowest_index
      ordered_nums.insert(lowest_index, num)
    else
      highest_index = ordered_nums.rindex { |ordered_num| after_rules[num].include?(ordered_num) }
      if highest_index
        ordered_nums.insert(highest_index + 1, num)
      else
        ordered_nums.push(num)
      end
    end
  end

  return ordered_nums
end

before_rules = Hash.new { |h, key| h[key] = [] }
after_rules = Hash.new { |h, key| h[key] = [] }
agg = 0

IO.foreach("input.txt") do |line|
  if line =~ /\|/
    nums = line.split('|').map(&:chomp)
    before_rules[nums[0]].push(nums[1])
    after_rules[nums[1]].push(nums[0])
  else
    nums = line.chomp.split(',')
    if !is_ordered(nums, before_rules)
      ordered_nums = order_nums(nums, before_rules, after_rules)
      agg += ordered_nums[ordered_nums.size/2].to_i
    end
  end
end

p agg