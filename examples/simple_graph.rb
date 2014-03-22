# Console test.
#
# Run this from your console for a simple test,
# Includes classes, creates a graph, adds four nodes, connects them, deletes one node and prints the circuit.
# This is a graphical representation of the created graph.
#
#         ----2-----
#        |         |
#  ---1--          -4-------...
#       |         |
#       -----3-----
#

# Loading all dependencies.
Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |f| load(f) }

# Prints specified amount of linebreaks.
def print_spacing spaces
  spaces.times do
    puts "\n"
  end
end

# Prints specified message as a heading.
def print_heading_message message
  puts message

  message.size.times do
    print "-"
  end
  print_spacing(1)
end

print_heading_message "Creating graph:"
a = Graph.new
puts a.inspect
print_spacing(2)

print_heading_message "Adding components:"
puts a.inspect
a.add(Node.new(:component_1))
puts a.node(:component_1).inspect
a.add(Node.new(:component_2))
puts a.node(:component_2).inspect
a.add(Node.new(:component_3))
puts a.node(:component_3).inspect
a.add(Node.new(:component_4))
puts a.node(:component_4).inspect
print_spacing(1)
puts "Graph:"
puts a.inspect
print_spacing(1)

print_heading_message "Connecting components:"
a.node(:component_1).connect_to(a.node(:component_2),"Serie")
a.node(:component_1).connect_to(a.node(:component_3),"Serie")
a.node(:component_2).connect_to(a.node(:component_3),"Paralelo")
a.node(:component_3).connect_to(a.node(:component_4),"Serie")
a.node(:component_2).connect_to(a.node(:component_4),"Serie")
puts "Edges created!"
print_spacing(1)
puts "Graph with the edges:"
puts a.inspect
print_spacing(2)

print_heading_message "Printing relations (edges):"
puts "Aristas de 'component_1':"
puts a.node(:component_1).instance_variable_get(:@out_edges).inspect
puts "Aristas de 'component_2':"
puts a.node(:component_2).instance_variable_get(:@out_edges).inspect
puts "Aristas de 'component_3':"
puts a.node(:component_3).instance_variable_get(:@out_edges).inspect
puts "Aristas de 'component_4':"
puts a.node(:component_4).instance_variable_get(:@in_edges).inspect
print_spacing(2)


print_heading_message "Deleting component #4:"
a.delete(a.node(:component_4))
puts "Removing!"
print_spacing(2)

print_heading_message "Console Serialization:"
a.console_serialization
print_spacing(2)
puts "Graph:"
puts a.inspect
