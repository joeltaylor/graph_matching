# No shebang here.  Usage:
# ruby -I lib benchmark/benchmark.rb

require 'benchmark'
require 'graph_matching'

MAX_SIZE = 100

def complete_bigraph(n)
  g = GraphMatching::BipartiteGraph.new
  max_u = (n.to_f / 2).ceil
  min_v = max_u + 1
  1.upto(max_u) do |i|
    min_v.upto(n) do |j|
      g.add_edge(i, j)
    end
  end
  g
end

1.upto(MAX_SIZE) do |v|
  print "%5d\t" % [v]
  g = complete_bigraph(v)
  puts Benchmark.realtime { g.maximum_cardinality_matching }
end