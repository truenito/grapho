class Node
  attr_reader :key

  def initialize(key, properties = nil)
    @key        = key
    @in_edges   = Set.new
    @out_edges  = Set.new

    self.properties = properties
  end

  def inspect
    "#<#{ self.class.name } key=#{ @key.inspect }>"
  end

  alias_method :to_s, :inspect

  def connect_to(target, label = nil, properties = nil)
    Edge.new(self, target, label, properties).tap do |edge|
      self.connect_via(edge)
      target.connect_via(edge)
    end
  end

  def connect_via(edge)
    connect_endpoint(@in_edges, edge) if edge.to == self
    connect_endpoint(@out_edges, edge) if edge.from == self

    edge
  end

  def disconnect_via(edge)
    @in_edges.delete(edge)
    @out_edges.delete(edge)

    nil
  end

  def edges(direction, label = nil)
    select_edges(direction == :in ? @in_edges : @out_edges, label)
  end

  # Reworking nodes method.
  # def nodes(direction, label = nil)
  #   edges(direction, label).map(&(direction == :in ? :from : :to))
  # end

  private
  def connect_endpoint(collection, edge)
    collection.add(edge)
  end

  def select_edges(edges, label)
    label.nil? ? edges : edges.select { |edge| edge.label == label }
  end

  def properties
    @properties ||= Hash.new
  end

  def properties=(new_props)
    @properties = new_props
  end

  def set(key, value)
    properties[key] = value
  end

  def get(key)
    properties[key]
  end

end
