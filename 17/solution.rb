input = 355

buffer = [0]
pos = 0

2017.times do |i|
	pos = (pos + input) % buffer.length + 1
	buffer.insert(pos, i + 1)
end

puts "answer1 = #{buffer[buffer.index(2017) + 1]}"

answer2 = -1

50_000_000.times do |i|
	pos = (pos + input) % (i + 1) + 1
	answer2 = i + 1 if pos == 1
end

puts "answer2 = #{answer2}"

