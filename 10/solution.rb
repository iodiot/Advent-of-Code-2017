input = "94,84,0,79,2,27,81,1,123,93,218,23,103,255,254,243"

list = Array.new(256) {|x| x}

lengths = input.split(',').map {|x| x.to_i}

skip = 0
pos = 0

lengths.each do |len|
  a = []
  len.times {|i| a << list[(i + pos) % list.count]}
  len.times {|i| list[(i + pos) % list.count] = a.reverse[i]}

	pos += len + skip
	skip += 1
end

answer1 = list[0] * list[1]

p "answer1 = #{answer1}"