def search (nums, target)
  start, last = 0, (nums.length - 1)

  while start <= last
    mid_i = start + ((last - start) / 2)
    if nums[mid_i] == target
      
    elsif nums[mid_i] > target
      last = mid_i - 1
    else
      start = mid_i + 1
    end
  end
  -1
end