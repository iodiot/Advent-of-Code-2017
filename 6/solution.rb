def get_max_index a
	max_v, max_i = -1, -1
	for i in 0...a.count
		if a[i] > max_v
			max_v = a[i]
			max_i = i
		end
	end
	max_i
end

memory = File.open("input.txt", "r").read.split(' ').map {|x| x.to_i}

previous = []
cycles = {}
n = 0

loop do 
	i = get_max_index memory
	blocks = memory[i]
	memory[i] = 0
	
	while blocks > 0
		i = (i + 1) % memory.count
		memory[i] += 1
		blocks -= 1
	end
	n += 1

	break if previous.include? memory.to_s
	previous << memory.to_s
	cycles[memory.to_s] = n
end

puts "answer1 = #{n}"
puts "answer2 = #{n - cycles[memory.to_s]}"