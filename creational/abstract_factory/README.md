Abstract Factory
================
This pattern provides an interface for creating families of objects without specifying their concrete classes

## Scenarios
When there are related objects that are used together in an application.

## Motivation
When there are lots of objects, each under a particular family/group, many times we end up with
conditionals scattered across all the places where we instantiate objects. It's not rare to see the
same switch/case or if/else in many classes that return an object of a specific type based on the condition.
This becomes a maintenance hell later.
Ideally, the decision of which group to choose should be made by the application which uses the objects,
and the application shouldn't know anything apart from the interfaces on the objects it needs to know.

## Implementation notes
1. The Client believes that the Factory family it uses during runtime has all the ConcreteProducts it needs,
and also that same product from each family has the same interface. This may cause problems at run time
with dynamically typed languages like Ruby, since the Concrete classes aren't subclasses of an Abstract Class
which enforces an inteface to be implemented.
2. For concrete classes that derive from an Abstract interface, it's run time safe. But it's difficult to
create a new product. We need to add the interface in the Abstract class and all Subclasses.

## Related Patterns
TODO - Add how other patterns are related.


## Examples
[GUI Factory](http://rubydoc.info/github/emilsoman/design-patterns-ruby/master/Creational/AbstractFactory/GuiFactoryExample)
