a = 289
b = 629

pa = 16807
pb = 48271

m = 2147483647

pairs = 0

40_000_000.times do
	a = (a * pa) % m
	b = (b * pb) % m

	pairs += 1 if a % 65536 == b % 65536
end

puts "answer1 = #{pairs}"

a = 289
b = 629

pairs = 0

5_000_000.times do
	begin 
		a = (a * pa) % m
	end while (a % 4) != 0
	
	begin
		b = (b * pb) % m
	end while (b % 8) != 0 

	pairs += 1 if a % 65536 == b % 65536
end

puts "answer2 = #{pairs}"