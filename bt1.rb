i = 0 # biến nên đặt tên có ý nghĩa hơn
a = [] # biến nên đặt tên có ý nghĩa hơn, biến chứa nhiều phần tử nên là số nhiều

puts "Nhap -1 de dung"
loop {
	#try-catch
	begin
		print "Nhap a[#{i}]:"
		temp = Integer(gets.chomp)
		#Dung khi nhap -1
		break if temp == -1
		#So tu nhien luon lon hon hoac bang 0
		raise if temp < 0
		a[i] = temp
	rescue
		puts "Vui long nhap so tu nhien"
		retry
	end	
	i+=1
	#Dung khi nhap 99 so
	break if i == 99
}
puts "#{a}"
#Cach 1 - Sap xep mang tang dan va lay vi tri 0
# if a.length >= 1
# 	a.sort!
# 	min = a[0]
# 	puts "Gia tri nho nhat la: #{min}"
# elsif
# 	puts "Khong co gia tri nho nhat"
# end
	
#Cach 2 - Khong lam thay doi mang a
if a.length >= 1
	min = a[0]
	for pos in 1..i-1
		min = a[pos] if min > a[pos]
	end
	puts "Gia tri nho nhat la: #{min}"
elsif
	puts "Khong co gia tri nho nhat"
end
	
# Chương trình e viết gọn gàng, biết sử dụng rescue, raise là một điểm cộng. xử lý được trường hợp vừa s
# Tuy nhiên, cần đặt tên biến có ý nghĩa hơn
