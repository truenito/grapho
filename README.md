Grapho
======
Grapho is a extendable nano framework based on Turbuine that allows the user to create directed graphs to do awesome stuff like represent circuits, family trees and pretty much everything that can be modeled using a graph. 

It has reached a state of simplicity and is open for you to tinker with it. In it's current implementation Grapho models a circuit where the edges have a direction and the documentation is in form of ruby comments (Spanish).
Theres still is a lot to do.

--------------

Grapho consists of three main classes, Graph, Node and Edge.


Creating a Graph:

```a = Graph.new```

Adding components:

```a.add(Node.new(:component_1))```
```a.add(Node.new(:component_2))```

Connecting components:
``` a.node(:componente_1).connect_to(a.node(:componente_2),"Serie")```

Deleting Components:
```a.delete(a.node(:component_1))```

*Will finish the project, I swear*

  [Gabriel González Mañaná]: http://estilopanda.com
  [@gabrieldgm]: http://twitter.com/gabrieldgm  
