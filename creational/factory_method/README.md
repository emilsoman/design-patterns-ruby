Factory Method
==============
Factory Method defines an interface for creating an object, so that the client that uses
the object doesn't need to know about how the object was created or what went into creating
the object, and it can just depend on the interfaces of the created object. This allows to
change the type of object easily without opening the client.

## Scenarios
Use Factory Method when a class should care about only the behaviour of an object it uses
and not its type. Factory Method is a good pattern to remove coupling between the client
that uses an object and the type of that object. The client who needs to use the object
gets it from the Factory method instead of specifying the type within itself.

## Motivation
Consider a client that needs to use an object to carry out its work, but it's only concerned about the
interfaces on the object and not the internal representation. This means the object can be replaced
with an instance of the subclass of it's type, and the client should not care. If the creation of the
object happens inside the client, and if the client needs to work on a different type of object later,
we'll have to open the class and change the object creation logic. If the creation of the object is
abstracted into a method in a Factory, it would be easier to modify.

## Collaborators
### Factory
This class/module has a creator method which instantiates and returns an instance
of a Product type. The method can accept a parameter based on which the type of Product
to be instantiated can be decided.

### Product
The type of instance produced by the factory. Usually factories produce different types of
products depending on the parameter passed to it, hence usually there will be more than one
Product

### Client
Uses only the interfaces provided by the product instantiated by the Factory.

## Implementation notes
Factory method can be used in 2 ways :
1. Use an AbstractCreator with a method to return a BaseProduct. Subclass the AbstractCreator to
ConcreteCreators which overrides the method to return a subclass of BaseProduct. The client can
use an instance of the ConcreteCreator to start using its product. This is very similar to
AbstractFactory, the only difference being, AbstractFactory uses multiple Factory Methods to
instantiate the different types of products in a family.
2. Use a Factory which has a creator method which accepts a type parameter. The type parameter
differentiates between the product types that the creator method would create and return. We could
use a module or a singleton class to define the creator method.

## Related Patterns
Abstract Factory Method - Abstract Factory is implemented using Factory Methods.


## Examples
TODO: add an example
