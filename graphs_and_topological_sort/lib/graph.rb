class Vertex
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
  attr_accessor :value, :in_edges, :out_edges
end

class Edge
  def initialize(from_vertex, to_vertex, cost = 1)

    @from_vertex = from_vertex
    @to_vertex = to_vertex

    @cost = cost

    @to_vertex.in_edges << self
    @from_vertex.out_edges << self

  end

  attr_accessor :cost, :to_vertex, :from_vertex, :destination

  def destroy!
    @from_vertex.out_edges.delete(self)

    @to_vertex.in_edges.delete(self)

    @from_vertex, @to_vertex = nil

  end

  def destination
  end
end
