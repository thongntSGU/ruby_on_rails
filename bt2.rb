nhanvien = Hash.new
puts "Nhap so thu tu"
nhanvien[:stt] = gets.chomp
puts "Nhap id"
nhanvien[:id] = gets.chomp
puts "Nhap ten"
nhanvien[:ten] = gets.chomp
puts "Nhap nam sinh"
nhanvien[:namsinh] = gets.chomp
puts "Nhap chuc vu"
nhanvien[:chucvu] = gets.chomp
puts "Nhap luong 1 ngay"
nhanvien[:luongCoBan] = gets.chomp
puts "Nhap ngay lam"
nhanvien[:ngayLam] = gets.chomp

nhanvien.each{|key, value| puts "#{key} #{value}"}
