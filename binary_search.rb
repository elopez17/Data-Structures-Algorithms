# Suppose an array sorted in acsending order is rotated at some pivot
# unknown to you before hand.
# (ie. [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2])

# You are given a target value to search. If found in the array return
# its index, otherwise return -1.
# You may assume no duplicates exists in the array.

# Runtime complexity O(log n)
# Space complexity O(1)

def search (nums, target)
  start, last = 0, (nums.length - 1)

  while start <= last
    mid = start + ((last - start + 1) >> 1)

    if nums[mid] == target
      return mid
    elsif nums[start] > nums[last]
      if nums[mid] > nums[last]
        if target < nums[mid] && target >= nums[start]
          last = mid - 1
        else
          start = mid + 1
        end
      else
        if target > nums[mid] && target <= nums[last]
          start = mid + 1
        else
          last = mid - 1
        end
      end
    elsif nums[mid] > target
      last = mid - 1
    else
      start = mid + 1
    end
  end

  -1
end

arr = [4,5,6,7,0,1,2]
p "input array: ", arr

puts "search(array, 0) returned: #{search(arr, 0)}"
puts "search(array, 3) returned: #{search(arr, 3)}"
