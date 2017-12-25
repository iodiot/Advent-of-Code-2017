list = File.open("input.txt", "r").read.split(/\n/).map{|x| x.to_i}

i, jumps = 0, 0

while i >= 0 and i < list.count
	offset = list[i]
	# for the first part
	# list[i] += 1 
	list[i] += offset >= 3 ? -1 : 1
	i += offset
	jumps += 1
end


puts "answer = #{jumps}"