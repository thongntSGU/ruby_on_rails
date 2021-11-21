#Bien toan cuc
@num_Arrays = []

#Ham nhap n
def input
  #try-catch
  begin
    print "Nhap n: "
    n = Integer(gets.chomp)
    raise if n < 0 || n > 100
  rescue
    puts "Vui long so tu nhien thuoc [1, 99]"
    retry
  end
  return Integer(n)
end

#Ham khoi tao mang ngau nhien gia tri [1, 9]
def create_Random_Arrays
  (0...input).each {|i|
    @num_Arrays[i] = Random.rand(1..9)
  }
  puts "#{@num_Arrays}"
end

#Mang con tang dan lien tuc
def increase_Sub_Arrays
  sub_Arrays = []
  count = 0
  for i in 0..@num_Arrays.length-1
    if i == @num_Arrays.length-1
      sub_Arrays << @num_Arrays[i]
      puts "mang con tang #{count+=1}: #{sub_Arrays}"
      sub_Arrays.clear
      break
    end
    if @num_Arrays[i] < @num_Arrays[i+1]
      sub_Arrays << @num_Arrays[i]
    elsif
      sub_Arrays << @num_Arrays[i]
      puts "mang con tang #{count+=1}: #{sub_Arrays}"
      sub_Arrays.clear
    end
  end
end

create_Random_Arrays
increase_Sub_Arrays
