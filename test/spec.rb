require 'rack/test'
require 'minitest/autorun'
Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |f| load(f) }

describe Graph do
  before do
    @graph = Graph.new
  end

  it "must be instance of graph" do
    @graph.must_be_instance_of Graph
  end

  it "must respond to inspect" do
    @graph.must_respond_to :inspect
  end

  it "must be able to add nodes" do
    @graph.add(Node.new(:test_component_1))
    @graph.add(Node.new(:test_component_2))
    @graph.inspect.must_equal("#<#{@graph.class} (2 nodes)>")
  end

  it "must be able to connect components" do
    @graph.add(Node.new(:test_component_1))
    @graph.add(Node.new(:test_component_2))
    @graph.node(:test_component_1).connect_to(@graph.node(:test_component_2),"Test Connection")
    @graph.inspect.must_equal("#<#{@graph.class} (2 nodes)>")
    @graph.node(:test_component_1).instance_variable_get(:@out_edges).inspect.must_equal("#<Set: {#<Edge :test_component_1 -\"Test Connection\"-> :test_component_2>}>")
  end

  it "must be able to delete nodes" do
    @graph.add(Node.new(:test_component_1))
    @graph.inspect.must_equal("#<#{@graph.class} (1 nodes)>")
    @graph.delete(Node.new(:test_component_1))
    @graph.inspect.must_equal("#<#{@graph.class} (0 nodes)>")
  end

end
