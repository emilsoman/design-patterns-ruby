Builder
=======
This pattern works by creates an abstract plan describing the steps for creating a complex object,
and then carry out the same steps on different implementations, as long as each implementation
implements all the steps.

## Scenarios
When the application needs to create complex objects of different types, but all of them are
created with the same steps.

## Motivation
When a client needs to create a complex object which is composed of many components
which are added to the object as steps, you may decide on building the
object right in the client. It may not be the best thing to do, because now
the creation steps and the representation of the object are coupled together.
After adding another type of complex object which can be built from the same data that
the client holds, you end up with a lot of conditionals in your client. Also you end
up repeating the same building logic if a different client needs to create the same type of object.

## Implementation notes
1. The Director needs to know the steps for creating a complex object. And all complex object types
have to implement the steps.
2. The base Builder class need not be an abstract class which raises an NotImlementedError, instead,
it may choose to define empty methods. This way, the Concrete Builders do not need to implement those
steps that have no effect on the internal representation of that type of complex object.

## Related Patterns
TODO - Add how other patterns are related.

## Examples
TODO
