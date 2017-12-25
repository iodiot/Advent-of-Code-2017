answer1 = 0

File.open("input.txt", "r").each do |line|
	words = line.split(' ')

	answer1 += 1 if words.count == words.uniq.count	
end

puts "answer1 = #{answer1}"

answer2 = 0

File.open("input.txt", "r").each do |line|
	words = line.split(' ').map {|w| w.each_char.sort.join }

	answer2 += 1 if words.count == words.uniq.count	
end

puts "answer2 = #{answer2}"