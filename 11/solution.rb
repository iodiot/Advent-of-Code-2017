input = File.open("input.txt", "r").read

steps = input.split(",")

#   \ n  /
# nw +--+ ne
#   /    \
# -+      +-
#   \    /
# sw +--+ se
#   / s  \

# x + y + z = 0

def distance(x, z)
	# to cube coordinates
	y = -x-z
	[x.abs, y.abs, z.abs].max
end

x, z = 0, 0
max_distance = -1

steps.each do |step|
	case step
	when "n"
		z -= 1
	when "ne"
		x += 1
		z -= 1
	when "se"
		x += 1
	when "s"
		z += 1
	when "sw"
		x -= 1
		z += 1
	when "nw"
		x -= 1
	end

	max_distance = [distance(x, z), max_distance].max
end

puts "answer1 = #{distance(x, z)}"
puts "answer2 = #{max_distance}"