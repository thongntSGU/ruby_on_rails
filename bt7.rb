# @array_a = [5, 1, 22, 26, 6, -1, 8, 10]
# @array_b = [1, 6, -1, 10]

@array_a = []
@array_b = []

#Create values random
def create_values_random(max_int = 10, value_range = 10)
	length_array_a = Random.rand(1..max_int)
	length_array_b = Random.rand(1..max_int)
	(0...length_array_a).each{
		|i|
		@array_a[i] = Random.rand(-1 * (value_range)..value_range)
	}
	(0...length_array_b).each{
		|i|
		@array_b[i] = Random.rand(-1 * (value_range)..value_range)
	}
end

#Check array_b is sub array of array_a
def check_sub_array(array_a, array_b)
	return "false (mang B > mang A)" if array_a.length < array_b.length
	count = 0
	for i in 0...array_a.length
		count += 1 if array_a[i] == array_b[count]
	end
	return count == array_b.length ? "true" : "false"
end

create_values_random
puts "Mang a: #{@array_a}"
puts "Mang b: #{@array_b}"
puts "#{check_sub_array(@array_a, @array_b)}"