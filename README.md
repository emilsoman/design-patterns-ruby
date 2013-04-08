design-patterns-ruby
====================

[![Build Status](https://travis-ci.org/emilsoman/design-patterns-ruby.png?branch=master)](https://travis-ci.org/emilsoman/design-patterns-ruby)
[![Coverage Status](https://coveralls.io/repos/emilsoman/design-patterns-ruby/badge.png?branch=master)](https://coveralls.io/r/emilsoman/design-patterns-ruby)
[![Code Climate](https://codeclimate.com/github/emilsoman/design-patterns-ruby.png)](https://codeclimate.com/github/emilsoman/design-patterns-ruby)

-------

## Design Patterns

### [Creational Patterns](/creational)
> Design patterns that deal with object creation mechanisms,
  trying to create objects in a manner suitable to the situation.
  
* [Abstract Factory](/creational/abstract_factory) -
  For creating and using families of related/dependent objects
* [Builder](/creational/builder) -
  For creating different types of complex objects step by step
* [Factory Method](/creational/factory_method) -
  For creating one type of object out of many which can be used in its place
* [Prototype](/creational/prototype) -
  Up next.
* [Singleton](/creational/singleton) -
  Coming soon ( Explain Ruby's singleton too )

### Structural Patterns
* Explain what a Structural Pattern means
* Add Patterns and links to examples here

### Behavioral Patterns
* Explain what a Behavioral Pattern means
* Add Patterns and links to examples here

-------

## About reading code and running tests

The code is heavily documented, and has 100% test coverage. Browse through
the [Documentation online](http://rubydoc.info/github/emilsoman/design-patterns-ruby/master/frames).
It contains explanations of each pattern example. It's also recommended
to go throught the tests in `spec/` directory to get an idea of how the examples
work.

To run the tests :

    bundle install
    rake

-------

## Contributing

_Step 1_ : Fork

_Step 2_ :

1. Add Ruby examples to Design Patterns.
2. Each example should have 100% green test coverage.
3. Each example should have RDocs/YARDocs that explain what each class does.
4. Each pattern should have its own README.md explaining it.
5. If there is a Ruby way that bakes in the pattern in the language, do not re-invent the wheel and show the Ruby way.
Explain how the example works.

_Step 3_ : Send a pull request


