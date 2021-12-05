numbers = [12, 3, 1, 2, -6, 5, -8, 6]
target_sum = 0

def three_elements_equal_target(arrays, target_sum)

  result = []

  for i in (0...(arrays.length-1))

    hash = {}
    first_value = arrays[i]
    temp = target_sum - first_value

    for j in ((i + 1)...(arrays.length))

      last_value = arrays[j]
      mid_value = temp - arrays[j]
      element_of_result = []

      if hash[mid_value]
        element_of_result << first_value << mid_value << last_value
        result << element_of_result
      else
        hash[last_value] = true
      end
    end
  end
  puts "#{result}"
end

three_elements_equal_target(numbers, target_sum)