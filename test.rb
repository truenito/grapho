# encoding: UTF-8
# Main de prueba
#
# @nota Se puede ejecutar desde la linea de comando utilizando "ruby test.rb" una vez Ruby está instalado.
# @reference Windows: http://rubyinstaller.org/ .
# 
# @brief:
# Incluye las clases, crea un grafo, le añade cuatro componentes
# luego las conecta de esta manera:
#
#        ----X-----
#       |         |
#  ---X--         X----
#       |         |
#       -----X-----
#
# Luego pasa a eliminar el cuarto componenete e imprime, para finalizar
# Imprimiendo las conecciones (aristas) contenidas en cada uno de los nodos.

load 'edge.rb'
load 'graph.rb'
load 'node.rb'

puts "Creando grafo:"
puts "------- ------"
a = Graph.new
puts a.inspect
puts ""
puts ""
puts "Añadiendo componentes:"
puts "--------- ------------"
puts a.inspect
a.add(Node.new(:componente_1))
puts a.node(:componente_1).inspect
a.add(Node.new(:componente_2))
puts a.node(:componente_2).inspect
a.add(Node.new(:componente_3))
puts a.node(:componente_3).inspect
a.add(Node.new(:componente_4))
puts a.node(:componente_4).inspect
puts ""
puts "Grafo:"
puts a.inspect
puts ""
puts "Conectando componentes por detrás:"
puts "--------- ------------ --- -------"

a.node(:componente_1).connect_to(a.node(:componente_2),"Serie")
a.node(:componente_1).connect_to(a.node(:componente_3),"Serie")
a.node(:componente_2).connect_to(a.node(:componente_3),"Paralelo")
a.node(:componente_3).connect_to(a.node(:componente_2),"Paralelo")
a.node(:componente_3).connect_to(a.node(:componente_4),"Serie")
a.node(:componente_2).connect_to(a.node(:componente_4),"Serie")

puts "Aristas creadas!"
puts ""
puts "Grafo con aristas:"
puts a.inspect
puts ""
puts ""
puts "Imprimiendo relaciones:"
puts "---------- ------------"

puts "Aristas de 'componente_1':"
puts a.node(:componente_1).instance_variable_get(:@out_edges).inspect
puts "Aristas de 'componente_2':"
puts a.node(:componente_2).instance_variable_get(:@out_edges).inspect
puts "Aristas de 'componente_3':"
puts a.node(:componente_3).instance_variable_get(:@out_edges).inspect
puts "Aristas de 'componente_4':"
puts a.node(:componente_4).instance_variable_get(:@in_edges).inspect
puts ""
puts ""

puts "Eliminando componente #4:"
puts "---------- ---------- ---"

a.delete(a.node(:componente_4))

puts "Eliminado!"
puts ""
puts ""
puts "Circuito serializado:"
puts "-------- ------------"
a.serialize
puts ""
puts ""
puts "Grafo final:"
puts a.inspect

