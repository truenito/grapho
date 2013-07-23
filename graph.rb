# @brief Clase del grafo, contiene nodos y vertices.
class Graph
  # @brief Requiriendo a "set", una colleción de valores sin orden y sin duplicados.
  # @reference http://www.ruby-doc.org/stdlib-2.0/libdoc/set/rdoc/Set.html
  require 'set'

  # @brief constructor del Graph.
  def initialize
    @nodes = {}
  end

  # @brief añade un node al Graph.
  # @params nodo a añadir.
  # @returns nodo creado.
  def add(node)
    @nodes[node.key] = node
  end

  # @brief Desconecta todas las aristas de un nodo iterando por las entradas y salidas
  # y luego lo elimina del Graph através del identificador.
  # @params nodo a eliminar.
  # @returns nodo eliminado.
  def delete(node)
    (node.edges(:out) + node.edges(:in)).each do |edge|
      edge.from.disconnect_via(edge)
      edge.to.disconnect_via(edge)
    end
    @nodes.delete(node.key)
  end

  # @brief retorna un nodo en el grafo cuyo identificador sea "key".
  # @params identificador del nodo (key),
  # @returns nodo buscsado.
  def node(key)
    @nodes[key]
  end

  # @brief retorna los nodos existentes en el grafo.
  # @returns arreglo de nodos con sus valores.
  def nodes
    @nodes.values
  end

  # @brief Serializa el grapfo al imprimirlo en la consola
  def serialize
    self.nodes.each do |a|
      puts "Componente" + a.inspect
      puts a.instance_variable_get(:@out_edges).inspect
      puts a.instance_variable_get(:@in_edges).inspect
      puts ""
    end
  end

  # @brief Redefiniendo el metodo de inspect de Ruby para retornar una forma más lejible
  # del grafo, se retorna un string conteniendo la cantidad de nodos y aristas.
  # @returns string con la cantidad de nodos y aristas.
  def inspect
    "#<#{self.class} (#{ @nodes.length } nodes>"
  end
end