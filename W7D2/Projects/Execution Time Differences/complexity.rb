def my_min(list)
  smallest = true
  (0...list.length).each do |index|
    (0...list.length).each do |index2|
      smallest = false if list[index] > list[index2]   
    end
    return list[index] if smallest         
  end
end

def my_min_optimized(list)
  smallest = list.first
  list.each {|num| smallest = num if num < smallest}
  smallest
end

def largest_contiguous_subsum(list)
  sub_arr = []
  (0...list.length).each do |idx|
    (idx...list.length).each do |i|
      sub_arr << list[idx..i]
    end
  end
  sums = []
  sub_arr.each do |sub|
    sums << sub.sum
  end
  sums.max
end

def largest_contiguous_subsum_optimized(list)
  max_sum = list.first
  current_sum = list.first
  if list.all? {|num| num < 0}
    return list.max
  else
    list.drop(1).each do |num|
      current_sum = 0 if current_sum < 0
      current_sum += num
      max_sum = current_sum if current_sum > max_sum
    end
  end
  max_sum
end