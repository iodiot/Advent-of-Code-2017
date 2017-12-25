answer1, answer2 = 0, 0

leafs = []
nodes = []

File.open("input.txt", "r").each do |line|
	tokens = line.split(" ")
	nodes << tokens[0]
	leafs << tokens[3..-1].join.split(",") if tokens.count > 2
end

leafs.flatten!

for node in nodes 
	answer1 = node unless leafs.include? node
end

puts "answer1 = #{answer1}"


weights = {}
tree = {}

File.open("input.txt", "r").each do |line|
	tokens = line.split(" ")

	weights[tokens[0]] = tokens[1][1..-2].to_i
	tree[tokens[0]] = tokens.count > 2 ? tokens[3..-1].join.split(",") : []
end

def get_unbalanced_index(weights)
	weights.each_with_index do |w, i|
		return i if weights.count(w) == 1
	end
	-1
end

def balance_tree(node, tree, weights)
	branches = []
	tree[node].each do |subnode|
		branches << weights[subnode] + balance_tree(subnode, tree, weights)
	end

	i = get_unbalanced_index(branches)

	if i != -1
		node = tree[node][i]
		weight = weights[node]
		diff = branches.max - branches.min
		puts "answer2 = #{weight - diff}"
		exit
	end

	branches.inject(0) {|sum, x| sum += x}
end

balance_tree(answer1, tree, weights)

