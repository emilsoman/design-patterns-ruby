module Creational
  module AbstractFactory
    # This example demonstrates the AbstractFactory pattern
    # using classes for a simple cross platform GUI application.
    #
    # [Problem] There is a an application which needs to run on both Win
    #           and OSX platforms. Depending on the platform, the application
    #           needs to use the correct type of GUI components, like buttons.
    #           If the application knows about all the types of components,
    #           it's going to turn messy when a new platform or a new type
    #           of component is to be added.
    # [Solution] Use AbstractFactory pattern to abstract object creation
    #            based on the family the object belongs to (Win/OSX).
    #            ConcreteFactories - WinFactory and OsxFactory implement
    #            methods to return products of their families.
    #            WinButton and OsxButtons are the products that belong
    #            to Win and OSX families respectively
    #
    module GuiFactoryExample

      # [Role] AbstractFactory
      # This is the AbstractFactory class.
      # You don't really need this in Ruby thanks to duck typing.
      # But we'll make sure every subclass implements the instance methods.
      # Notice the NotImplementedError?
      # That makes sure every subclass of GuiFactory overrides its methods,
      # else it raises a NotImplemented error
      class GuiFactory
        def create_button
          raise NotImplementedError, "#{self.class.name} does not implement create_button()"
        end
      end

      # [Role] AbstractProduct
      # This is the AbstractProduct class.
      # You don't really need this in Ruby thanks to duck typing.
      # But we'll make sure every subclass implements the instance methods.
      # Notice the NotImplementedError?
      # That makes sure every subclass of AbstractButton overrides its methods,
      # else it raises a NotImplemented error
      class AbstractButton
        def paint
          raise NotImplementedError, "#{self.class.name} does not implement paint()"
        end
      end

      # [Role] ConcreteFactory
      # This is a ConcreteFactory class
      # It implements the operations to create
      # a ConcreteProduct object, in this case,
      # a WinButton object.
      # It should override all methods defined
      # in AbstractFactory
      class WinFactory < GuiFactory
        def create_button
          return WinButton.new
        end
      end

      # [Role] ConcreteFactory
      # This is a ConcreteFactory class
      # It implements the operations to create
      # a ConcreteProduct object, in this case,
      # an OsxButton object.
      # It should override all methods defined
      # in AbstractFactory
      class OsxFactory < GuiFactory
        def create_button
          return OsxButton.new
        end
      end

      # [Role] ConcreteProduct  
      # This is a ConcreteProduct class
      # How to create a WinButton is abstracted
      # into this class.
      # It should override all methods defined
      # in AbstractProduct
      class WinButton < AbstractButton
        def paint
          puts "I'm a WinButton"
        end
      end

      # [Role] ConcreteProduct
      # This is a ConcreteProduct class
      # How to create an OsxButton is abstracted
      # into this class.
      # It should override all methods defined
      # in AbstractProduct
      class OsxButton < AbstractButton
        def paint
          puts "I'm an OsxButton"
        end
      end

      # [Role] Client
      # This is the Client.
      # It uses only those interfaces provided by
      # the AbstractFactory which is GuiFactory
      # and the AbstractProduct which is the AbstractButton
      # classes.
      class Application
        def initialize(gui_factory)
          @gui_factory = gui_factory
        end

        def run
          button = @gui_factory.create_button
          button.paint
        end
      end

    end #GuiFactoryExample
  end #AbstractFactory
end #Creational
