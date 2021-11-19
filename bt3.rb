require "csv"
require "pg"
require "benchmark"

#Write a file
def write_file
	CSV.open("file.csv","wb") do |lines|
		#Header column
		#lines << ["name", "email", "phone", "address", "day_of_birth", "profile"]
		for i in 1..500000 do
			lines << ["Nguyen Van A #{i}", "nguyenvana#{i}@gmail.com", "0123456789", "Ho Chi Minh city", "2000/01/01", "Like TV 100\", Some special charactor: \\ / ' $ ~ & @ # ( ; \""]
		end
	end
	puts "Write a file DONE"
end

#Read file and Write database
def read_file_write_database
	CSV.foreach("file.csv") do |lines|
		#rubydoc.info/gems/pg/PG/Connection
		conn = PG::Connection.open('dbname' => 'bt3')
		res = conn.exec("INSERT INTO STAFF (name, email, phone, address, day_of_birth, profile) VALUES ('#{lines[0]}', '#{lines[1]}', '#{lines[2]}', '#{lines[3]}', '#{lines[4]}', '#{lines[5].gsub("'","''")}')");
	end
	puts "Write database DONE"
end

write_file

#Measure time by Benchmark
time_Benchmark = Benchmark.measure{
	read_file_write_database
}

#Measure time basic
start = Time.now
read_file_write_database
finish = Time.now
time_Basic = finish - start

puts "\nMeasure Time for Read file and Write database:"
puts "Config computer: Virtual Machine\n|\tProcessor: 1 CPU\n\|\t Memory: 6GB"
puts "|\t=> Benchmark: #{time_Benchmark.real}\n|\t=> Basic: #{time_Basic}"

# Phần code e trình bày gọn, dễ đọc, có tách hàm, biết sử dụng foreach, benchmark là điểm cộng
# db.exec, phần này a thấy e đang insert từng dòng vào trong db, tức là với 500k lines thì mình insert 500k lần về performance có thể bị ảnh hưởng
# do e hit vào db nhiều quá
# A suggest e là
#   1. sử dụng transaction -> e có thể tìm hiểu nó là gì
#   2. build ra 1 câu sql, nhưng khi nào đủ khoảng 5k lines (do e quyết định), rồi hẵn insert vào db. Như vậy sẽ giảm số lần e tương tác db ah
#

# Em trình bày trong 1 file vẫn ok, nhưng khi vào thực tế: e nên tách file ra để dễ quản lý. Vd: file về kết nối db, file để ghi ra file csv,
# file để import từ csv vào db -> mục đích là e sẽ dễ dàng quản lý và xử lý khi sau này có issues. Vd: không connect được db, thì e chỉ cần vào
# file quản lý cấu hình thôi, chứ kg cần scan hết trong 1 file tổng lớn
