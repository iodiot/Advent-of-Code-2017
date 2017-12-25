answer1 = 0

File.open("input.txt", "r").each do |line|
	a = line.split(' ').map {|x| x.to_i}
	answer1 += (a.max - a.min).abs
end

puts "answer1 = #{answer1}"

answer2 = 0

File.open("input.txt", "r").each do |line|
	a = line.split(' ').map {|x| x.to_i}.sort.reverse
	for i in 0...(a.length - 1)
		for j in (i + 1)...a.length
			answer2 += a[i] / a[j] if a[i] % a[j] == 0
		end
	end
end

puts "answer2 = #{answer2}"