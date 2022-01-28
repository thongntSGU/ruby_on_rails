numbers = [3, 5, -4, 8, 11, 1, -1, 6]
target_sum = 10

def find_2num_equal_target(array, target)
	complement_numbers = []
	for i in (0...array.length)
		complement = target - array[i]
		if complement_numbers.include?complement
			puts "[#{complement}, #{array[i]}]"
		end
		complement_numbers << array[i]
	end
end

find_2num_equal_target(numbers, target_sum)

# Code e viết rất gọn, giải thuật ok
# Khi e sử dụng biến complement_numbers để chứa mảng con và dùng include? cũng ok, nhưng vd sau này mảng có hàng triệu phần tử mà e sử dụng include? 
# như vậy sẽ chạy hơi lâu nhé
