require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  top = []

  vertices.each do |vertx|
    if vertx.in_edges.empty?
      top << vertx
    end
  end

  until top.empty?
    current = top.pop
    sorted << current

    edges = current.out_edges.dup

    edges.each do |edge|
      destination = edge.to_vertex
      edge.destroy!
      if destination.in_edges.empty?
        top << destination
      end

    end

  end
   return sorted if sorted.length == vertices.length
   []
end
