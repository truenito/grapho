# Console test.
# 
# Run this from your console for a simple test,
# Includes classes, creates a graph, adds four nodes, connects them, deletes one node and prints the circuit.
# This is a graphical representation of the created graph.
#
#        ----2-----
#       |         |
#  ---1--         4----
#       |         |
#       -----3-----
#
# Luego pasa a eliminar el cuarto componenete e imprime, para finalizar
# Imprimiendo las conecciones (aristas) contenidas en cada uno de los nodos.

load 'edge.rb'
load 'graph.rb'
load 'node.rb'

puts "Creating graph:"
puts "-------- ------"
a = Graph.new
puts a.inspect
puts ""
puts ""
puts "Adding components:"
puts "------ ------------"
puts a.inspect
a.add(Node.new(:component_1))
puts a.node(:component_1).inspect
a.add(Node.new(:component_2))
puts a.node(:component_2).inspect
a.add(Node.new(:component_3))
puts a.node(:component_3).inspect
a.add(Node.new(:component_4))
puts a.node(:component_4).inspect
puts ""
puts "Graph:"
puts a.inspect
puts ""
puts "Connecting components:"
puts "---------- -----------"

a.node(:component_1).connect_to(a.node(:component_2),"Serie")
a.node(:component_1).connect_to(a.node(:component_3),"Serie")
a.node(:component_2).connect_to(a.node(:component_3),"Paralelo")
a.node(:component_3).connect_to(a.node(:component_4),"Serie")
a.node(:component_2).connect_to(a.node(:component_4),"Serie")

puts "Edges created!"
puts ""
puts "Graph with the edges:"
puts a.inspect
puts ""
puts ""
puts "Printing relations (edges):"
puts "-------- --------- --------"

puts "Aristas de 'component_1':"
puts a.node(:component_1).instance_variable_get(:@out_edges).inspect
puts "Aristas de 'component_2':"
puts a.node(:component_2).instance_variable_get(:@out_edges).inspect
puts "Aristas de 'component_3':"
puts a.node(:component_3).instance_variable_get(:@out_edges).inspect
puts "Aristas de 'component_4':"
puts a.node(:component_4).instance_variable_get(:@in_edges).inspect
puts ""
puts ""

puts "Deleting component #4:"
puts "-------- --------- ---"

a.delete(a.node(:component_4))

puts "Removing!"
puts ""
puts ""
puts "Console Serialization:"
puts "------- --------------"
a.console_serialization
puts ""
puts ""
puts "Graph:"
puts a.inspect