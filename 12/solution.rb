graph = {}

File.open("input.txt", "r").each_line do |line|
	tokens = line.scan(/\d+/).map &:to_i
	graph[tokens[0]] = tokens.drop(1)
end

def get_group(graph, start)
	queue = [start]
	visited = []

	while not queue.empty?
		node = queue.shift
		graph[node].each do |sibling|
			next if visited.include? sibling
			queue.push sibling
			visited << sibling
		end
	end
	visited
end

nodes = graph.keys
groups = 0

while nodes.count > 0
	nodes -= get_group(graph, nodes.first)
	groups += 1
end

p "answer1 = #{get_group(graph, 0).count}"
p "answer2 = #{groups}"