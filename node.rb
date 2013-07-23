# @brief Clase de los nodos, contiene los nodos y la mayoría de la logica de coneccion
# de aristas etc.
class Node

  # @info Metodo de "get" para el identificador (estilo Ruby).
  # @reference http://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby
  attr_reader :key

  # @brief Constructor de Ruby, crea un nodo y propiedades de ser especificadas, 
  # esta puede ser, por ejemplo, la impedancia del componente.
  # @params key identificador del nodo
  # @params properties propiedades del nodo(Hash)
  # @nota contiene un set para las aristas que entran en el grafo y un set para las aristas que salen.
  # para ver más sobre sets aquí hay un buen articulo, y abajo la documentacion:
  # http://devblog.avdi.org/2012/08/27/array-set-operations-in-ruby/
  # @reference http://www.ruby-doc.org/stdlib-2.0/libdoc/set/rdoc/Set.html
  def initialize(key, properties = nil)
    @key        = key
    @in_edges   = Set.new
    @out_edges  = Set.new

    self.properties = properties
  end

  # @brief Redefiniendo el metodo de inspect de Ruby para retornar una forma más lejible
  # de un nodo, se retorna un string conteniendo la cantidad de nodos y aristas.
  # @returns arreglo de nodos con sus valores de identifiación.
  def inspect
    "#<#{ self.class.name } key=#{ @key.inspect }>"
  end

  alias_method :to_s, :inspect

  # @brief conecta el objeto de nodo con otro nodo.
  # @params target es el nodo hacia el que se quiere conectar.
  # @params label datos de la relacion entre los nodos, para el proyecto sería "serie" o "paralelo".
  # @params properties valores opcionales de propiedas para la relacion.
  def connect_to(target, label = nil, properties = nil)
    Edge.new(self, target, label, properties).tap do |edge|
      self.connect_via(edge)
      target.connect_via(edge)
    end
  end

  # @brief dado una arista creada, llama a agregar las aristas
  # en los sets correspondientes via "connect_endpoint" de realizar la coneccion sobre el nodo.
  # @params arista a crear.
  # @returns la arista.
  def connect_via(edge)
    connect_endpoint(@in_edges, edge) if edge.to == self
    connect_endpoint(@out_edges, edge) if edge.from == self

    edge
  end

  # @brief dado una arista creada, termina de realizar la desconeccion sobre el nodo.
  # @params arista a desconectar.
  # @returns nada.
  def disconnect_via(edge)
    @in_edges.delete(edge)
    @out_edges.delete(edge)

    nil
  end

  # @brief Retorna todas las aristas de un nodo en un arreglo.
  # @params direccion de la relacion.
  # @params label datos de la arista.
  # @returns arreglo de aristas devueltos.
  def edges(direction, label = nil)
    select_edges(direction == :in ? @in_edges : @out_edges, label)
  end

  # @brief Retorna todos los nodos en un arreglo.
  # @params direccion, etiqueta.
  # @returns arreglo de nodos devueltos.
  def nodes(direction, label = nil)
    edges(direction, label).map(&(direction == :in ? :from : :to))
  end

  private
  # @brief Metodo interno que añade la arista si no hay una arista similar ya presente.
  # @params coleccion y arista, la coleccion es el set "@in_edges" o "@out_edges".
  def connect_endpoint(collection, edge)
    collection.add(edge)
  end

  # @brief Metodo interno que, dado un arreglo de aristas y una etiqueta opcional selecciona
  # las aristas de un set o las aristas especiificas.
  # @params arista y etiqueta
  def select_edges(edges, label)
    label.nil? ? edges : edges.select { |edge| edge.label == label }
  end

  # Propiedades del nodo.
  # Basicamente aqui se encuentran las propiedades del nodo, estas son un hash.
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