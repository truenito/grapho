class Edge
  require 'set'
  attr_reader :from
  attr_reader :to
  attr_reader :label

  def initialize(from_node, to_node, label = nil, properties = nil)
    @from  = from_node
    @to    = to_node
    @label = label

    self.properties = properties
  end

  def inspect
    "#<#{ self.class.name } #{ to_s }>"
  end

  def to_s
    "#{ @from.key.inspect } -#{ @label.inspect }-> #{ @to.key.inspect }"
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

  def similar?(other)
    other && other.to == @to && other.from == @from && other.label == @label
  end

  def nodes(direction, *)
    direction == :to ? @to : @from
  end

end