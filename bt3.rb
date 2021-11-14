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




