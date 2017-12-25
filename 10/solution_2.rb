input = "94,84,0,79,2,27,81,1,123,93,218,23,103,255,254,243"

suffix = [17, 31, 73, 47, 23]

list = Array.new(256) {|x| x}
sequence = input.codepoints.to_a + suffix

def run_rounds(list, sequence)
	pos, skip = 0, 0
	64.times {
		sequence.each do |seq|
		  a = []
		  seq.times {|i| a << list[(i + pos) % list.count]}
		  seq.times {|i| list[(i + pos) % list.count] = a.reverse[i]}

			pos += seq + skip
			skip += 1
		end
	}
	list
end

sparse_hash = run_rounds(list, sequence)

dense_hash = sparse_hash.each_slice(16).to_a.map {|x| x.inject(0) {|xored, y| xored ^= y }}

answer2 = dense_hash.map {|x| "%02x" % x}.join

puts "answer2 = #{answer2}"