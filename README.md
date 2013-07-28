Grapho
======
Grapho is a extendable nano framework based on Turbine that allows the user to create directed graphs to do awesome stuff like represent circuits, family trees and pretty much everything that can be modeled using a graph. 

It has reached a state of simplicity and is open for you to tinker with it. In it's current implementation Grapho models a circuit where the edges have a direction.
I've been thinking about packing it as a gem, adding more functionalities and constraints but honestly, I think it's a lot more fun if it's kept accesible and hacky.

--------------

Grapho consists of three main classes, Graph, Node and Edge.


Creating a Graph:

```ruby
a = Graph.new
```

Adding components:

```ruby
a.add(Node.new(:component_1))
a.add(Node.new(:component_2))
```

Connecting components:
```ruby
a.node(:component_1).connect_to(a.node(:component_2),"Serie")
```

Deleting Components:
```ruby
a.delete(a.node(:component_1))
```

  [Gabriel González Mañaná]: http://estilopanda.com
  [@gabrieldgm]: http://twitter.com/gabrieldgm  
