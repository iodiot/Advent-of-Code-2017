layers = {}

File.open("input.txt", "r").each_line do |line|
	tokens = line.scan(/\d+/).map(&:to_i)
	layers[tokens[0]] = tokens[1]
end

def simulate(layers, delay, detect_capture)
	severity = 0
	for i in 0..layers.keys.last
		next unless layers.include? i
		captured = ((i + delay) % (layers[i] * 2 - 2)) == 0
		severity += i * layers[i] if captured
		return true if detect_capture and captured
	end
  detect_capture ? false : severity
end

delay = 0
loop do
	break unless simulate(layers, delay, true)
	delay += 1
end

p "answer1 = #{simulate(layers, 0, false)}"
p "answer2 = #{delay}"