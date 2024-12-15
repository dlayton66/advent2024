def is_unsafe(is_increasing, diff)
  return (is_increasing && diff > 0) || (!is_increasing && diff < 0) || diff.abs < 1 || diff.abs > 3
end

def check_array(arr, extra_try = true)
  is_increasing = arr[0] - arr[arr.size-1] < 0

  for i in 0..arr.size-2
    diff = arr[i] - arr[i+1]
    if is_unsafe(is_increasing, diff)
      return false if !extra_try
      new_arr = arr.dup
      new_arr_two = arr.dup
      new_arr.delete_at(i)
      new_arr_two.delete_at(i+1)
      return check_array(new_arr, false) || check_array(new_arr_two, false)
    end
  end
  return true
end

num_safe = 0

IO.foreach("input.txt") do |line|
  arr = line.split.map(&:to_i)
  num_safe+=1 if check_array(arr)
end

puts num_safe