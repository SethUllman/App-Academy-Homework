def bad_two_sum?(arr, target_sum)
  sums = []
  (0...arr.length).each do |idx| #n
    (idx+1...arr.length).each do |i| #n
      sums << arr[idx] + arr[i] #1
    end
  end
  sums.include?(target_sum) #n
end

#time complexity of bad_two_sum?: O(n^2)
#space complexity of bad_two_sum?: O(n^2)

def okay_two_sum?(arr, target_sum)
  array = arr.sort #n log n
  i1 = 0
  i2 = array.length-1
  while i1 < i2
    case array[i1] + array[i2] <=> target_sum
    when 0
      return true
    when -1
      i1 += 1
    when 1
      i2 -= 1
    end
  end
  false
end

#time complexity of okay_two_sum?: O(nlogn)
#space complexity of okay_two_sum?: O(n)