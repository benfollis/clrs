#Suppose that we are given a directed acyclic graph G D .V; E/ with real-
# valued edge weights and two distinguished vertices s and t. Describe a dynamic-
# programming approach for finding a longest weighted simple path from s to t.
# What does the subproblem graph look like? What is the efficiency of your algo-
# rithm?
#
# General idea is any longest weighted path from s->t is of max length |E| since G
# is A DAG. Therefore we will explore all paths of length 0, 1... up to |E|
# Also all paths must be simple, since it is a DAG
# Substructure is this: Given a longest weighted path P, it from s->t, it must pass through
# some node w, such that p s...->w...->t (where w may either b s or t) and that s -> w and w->t
# must themselves have optimal weight, or we could paste a new path s->w' in with maximal weight
# and get a maximal weight path that was greater. (Similarly for w->t).


def longest_weighted_dag_path(g)
  # s is a table from VxV detailing the longest path found so far
  # we will iterate through all paths lengths, and as we encounter
  # a node, will update the known weight.
  # For example, if we have a path of length 1 for node S-W and we are
  # looking for length two paths, and from W we see T then s[s][t] = max(s[s][t]), s[s][w]+w(w))

  # init the table
  v = g.vertices
  s = Hash.new(v.size)
  # paths of length 0 have zero weight
  v.each do |vertex|
    s << { s => 0}
  end
  v.size.times do |pathlength|
    v.each do |v|
      # do dfs of length pathlength (e.g eneuqeu nodes we discover)
    end
    #process the nodes and update wieghts for nodes discovered
  end




end
# run time of the algorithm is O(|V||V + E|) because we iterate in the outer loop |V| times (since a simlpe
# path must be ), and may visit up
# to |V| nodes and |E| edges per iteration. TOtal runtime is then O(|V||V| + |E||E|) = O(V^2+VE) = O(V^3) since a diag
# implies that |E| <=O(V^2)
