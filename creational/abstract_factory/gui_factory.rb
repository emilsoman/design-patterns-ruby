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
