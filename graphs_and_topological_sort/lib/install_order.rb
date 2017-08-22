# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to


require 'graph'
def install_order(arr)

  #for every array create 2 verties unless they already exist
  #create and edge that is a dependency on the 2 points

  verts = {}
  max = []
  arr.each do |dep|
    first = dep[0]
    secound = dep[1]

    verts[first] = Vertex.new(dep[0]) unless verts[first]
    verts[secound] = Vertex.new(dep[1]) unless verts[secound]
    Edge.new(verts[first], verts[secound]) if secound
  end
  topological_sort(verts.values).map {|v| v.value}





end
