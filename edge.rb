# @brief Clase de las aristas, contiene las aristas con su informacion de coneccion
# y la logica de impresion en pantalla.
# de aristas etc.
class Edge
  require 'set'
  # @info Metodo de "get" para las conecciones, desde y hasta. Además del label que contiene
  # información sobre la coneccion (arista).
  # @reference http://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby
  attr_reader :from
  attr_reader :to
  attr_reader :label

  # @brief Constructor de Ruby, crea una arista con una etiqueta y propiedades de ser especificadas, 
  # estas pueden ser, por ejemplo, la impedancia del componente.
  # @params from_node nodo desde el cual la arista conecta.
  # @params to_node nodo hasta el cual la arista conecta.
  # @params properties propiedades del nodo
  # @params label etiqueta del nodo
  def initialize(from_node, to_node, label = nil, properties = nil)
    @from  = from_node
    @to    = to_node
    @label = label

    self.properties = properties
  end

  # @brief Redefiniendo el metodo de inspect de Ruby para retornar una forma más lejible
  # de una arista, en conjunto con la funcion "to_s" retorna un string con el nodo que conecta
  # y el nodo hacia donde conecta, el caracter "\u27A4" es simplemente una flecha de izquierda a derecha.
  def inspect
    "#<#{ self.class.name } #{ to_s }>".sub('>', "\u27A4")
  end

# @reference ver mtodo "inspect" en línea 28.
# @brief retorna el identificador del nodo que conecta (con la etiqueta, para el caso paralelo o serio)
# y el nodo conectado.
  def to_s
    "#{ @from.key.inspect } -#{ @label.inspect }-> #{ @to.key.inspect }"
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

  # @brief Retorna si la coneccion de arista desde y hasta es igual y contiene la misma etiqueta en base
  # a otra arista, se usa en la clase nodo para validar duplicados.
  def similar?(other)
    other && other.to == @to && other.from == @from && other.label == @label
  end

  def nodes(direction, *)
    direction == :to ? @to : @from
  end
end