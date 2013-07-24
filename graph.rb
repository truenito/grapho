class Graph
  require 'set'

  def initialize
    @nodes = {}
  end

  def add(node)
    @nodes[node.key] = node
  end

  def delete(node)
    (node.edges(:out) + node.edges(:in)).each do |edge|
      edge.from.disconnect_via(edge)
      edge.to.disconnect_via(edge)
    end
    @nodes.delete(node.key)
  end

  def node(key)
    @nodes[key]
  end

  def nodes
    @nodes.values
  end

  def inspect
    "#<#{self.class} (#{ @nodes.length } nodes)>"
  end

  def console_serialization
    self.nodes.each do |a|
      puts "Component" + a.inspect
      puts a.instance_variable_get(:@out_edges).inspect
      puts a.instance_variable_get(:@in_edges).inspect
      puts ""
    end
  end

end