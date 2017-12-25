answer1, answer2 = 0, 0

nesting = 0
ignore_next = false
in_garbage = false

File.open("input.txt").read.each_char do |ch|
	if ignore_next
		ignore_next = false
		next
	end

	answer2 += 1 if in_garbage and ch != '>' and ch != '!'

	case ch
	when '{'
		unless in_garbage
			nesting += 1
			answer1 += nesting
		end
	when '}'
		nesting -= 1 unless in_garbage
	when '<'
		in_garbage = true
	when '>'
		in_garbage = false
	when '!'
		ignore_next = true
	end
end

puts "answer1 = #{answer1}"
puts "answer2 = #{answer2}"