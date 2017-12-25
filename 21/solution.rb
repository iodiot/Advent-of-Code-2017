def to_pattern(pattern)
	size = Math.sqrt(pattern.length).to_i
	pattern.chars.each_slice(size).map {|x| x.join}.join("/")
end

def transform(pattern, perm)
	r = "*" * pattern.length
	for i in 0...perm.length
		r[i] = pattern[perm[i].to_i]
	end
	r
end

def rotate(pattern, n)
	r = pattern.split("/").join
	size = Math.sqrt(r.length).to_i
	n.times {r = transform(r, "2031")} if size == 2
	n.times {r = transform(r, "630741852")} if size == 3
	to_pattern r
end

def flip_v(pattern)
	r = pattern.split("/").join
	size = Math.sqrt(r.length).to_i
	to_pattern (size == 2)	? transform(r, "1032") : transform(r, "210543876")
end

def flip_h(pattern)
	r = pattern.split("/").join
	size = Math.sqrt(r.length).to_i
	to_pattern (size == 2) ? transform(r, "2301") : transform(r, "678345012")
end

def divide(pattern)
	grid = pattern.split("/")
	size = (grid[0].length % 2 == 0) ? 2 : 3
	n = grid.length / size
	r = []

	for j in 0...n
		for i in 0...n
			s = ""
			for y in 0...size
				for x in 0...size
					s += grid[y + j * size][x + i * size]	
				end
			end
			r << s.chars.each_slice(size).map {|x| x.join}.join("/")
		end
	end
	r
end

def combine(patterns)
	return patterns[0] if patterns.length == 1

	size = Math.sqrt(patterns[0].split("/").join.length).to_i
	n = Math.sqrt(patterns.length).to_i 
	w = n * size

	r = "*" * (w * w)

	patterns.each_with_index do |p, i|
		pp = p.split("/")

		for y in 0...size
			for x in 0...size
				r[x + y * w + (i % n) * size + (i / n) * size * w] = pp[y][x]
			end
		end
	end
	r.chars.each_slice(w).map {|x| x.join}.join("/")
end

def enchance(rules, pattern)
	throw "MISSING: #{pattern}" unless rules.include? pattern
	rules[pattern]
end

rules = {}


File.open("input.txt", "r").each do |line|
	k, v = line.chomp.split(" => ").map{|x| x.split("/").join}
	(1..4).each do |i|
		r = rotate(k, i)
		rules[r] = v
		rules[flip_v(r)] = v
		rules[flip_h(r)] = v
	end
end

grid = ".#./..#/###"

5.times do |i|
	grids = divide(grid).map {|pattern| enchance(rules, pattern) }
	grid = combine(grids.flatten)

	p "#{i}: #{grid.length}"
end


p grid.count("#")
