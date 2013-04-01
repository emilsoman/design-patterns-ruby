Creational Patterns
===================

> Creational Patterns abstract the instantiation process.
> They help make a system independent of how its objects are created, composed and represented.
  -- GoF Design Patterns
  
## 1. [Abstract Factory](/creational/abstract_factory)
Provides an interface for creating families of objects without specifying their concrete classes
### Examples
[GUI factory](http://rubydoc.info/github/emilsoman/design-patterns-ruby/master/Creational/AbstractFactory/GuiFactoryExample)

## 2. [Builder](/creational/builder)
Helps you create complex objects step-by-step without coupling creational steps and internal representation if created object
### Examples
[Email Builder](http://rubydoc.info/github/emilsoman/design-patterns-ruby/master/Creational/Builder/EmailBuilderExample)


## 3. [Factory Method](/creational/factory_method)
Provides an interface for creating an object to be used in a client which allows to change the type of object easily without opening the client.
### Examples
[VersionControlFactory](http://rubydoc.info/github/emilsoman/design-patterns-ruby/master/Creational/FactoryMethod/VersionControlFactoryExample)
