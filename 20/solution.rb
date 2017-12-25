
def update(p)
	p[3] += p[6]
	p[4] += p[7]
	p[5] += p[8]
	p[0] += p[3]
	p[1] += p[4]
	p[2] += p[5]
end

def first(particles)
	1000.times do
		particles.each {|p| update(p)}
	end

	particles.map {|p| p[0].abs + p[1].abs + p[2].abs}.each_with_index.min[1]
end

def second(particles)
	1000.times do
		particles.each {|p| update(p)}

		t = {}
		particles.each do |p|
			h = p[0..2].to_s
			t[h] = [] unless t.include? h
			t[h] << p
		end
			 
		t.values.each {|v| particles -= v if v.length > 1 }
	end

	particles.length
end

particles = File.open("input.txt").readlines.map {|line| line.scan(/-?\d+/).map {|x| x.to_i}}
puts "answer1 = #{first(particles)}"

particles = File.open("input.txt").readlines.map {|line| line.scan(/-?\d+/).map {|x| x.to_i}}
puts "answer2 = #{second(particles)}"