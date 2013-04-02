module Creational
  module FactoryMethod
    # This example demonstrates the FactoryMethod pattern
    # by showing how a client class deals with Version Control
    # without knowing whether the version control is going to be
    # Git or SVN
    #
    # [Problem] There is a an application which needs to clone a project
    #           from it's version control repository. The initial requirement
    #           may require using only SVN version control. Hence the version
    #           control implementation may sometimes be defined inside the
    #           application by creating an object for handling Svn Version control.
    #           The requirement later changes and now the application needs to
    #           work for Git repositories as well. Since the Svn implementation
    #           was done inside the application, the developer now needs to open
    #           up the application to make the changes.
    # [Solution] Use FactoryMethod pattern to abstract object creation
    #            into a method outside the application. The application
    #            gets the version control object from the factory method,
    #            and uses the object to deal with the version control related
    #            interfaces without caring if it's Git or SVN.
    # [Collaborators]
    #           Factory:: {VersionControlFactory}
    #           Products:: {GitVersionControl, SvnVersionControl}
    #           Client:: {Application}
    module VersionControlFactoryExample
      # [Role] Factory
      # This is the Factory class which has the FactoryMethod.
      # The method accepts a string which tells the FactoryMethod
      # which version control object to create.
      class VersionControlFactory
        def self.create_version_control(type)
          case type
          when 'git'
            return GitVersionControl.new
          when 'svn'
            return SvnVersionControl.new
          else
            return #Can return a NullObject here.
          end
        end
      end

      # [Role] Product
      # This is the class that implements the Git
      # version of all VersionControl interfaces
      class GitVersionControl
        def clone
          puts "Using Git to clone project"
        end
      end

      # [Role] Product
      # This is the class that implements the Svn
      # version of all VersionControl interfaces
      class SvnVersionControl
        def clone
          puts "Using Svn to checkout project"
        end
      end

      # [Role] Client
      # This is the Client.
      # It gets the version control object from the factory
      # and calls methods on the object without knowing the
      # type of version control object
      class Application
        def initialize(version_control)
          @version_control = VersionControlFactory.create_version_control(version_control)
        end

        def run
          @version_control.clone
        end
      end

    end #VersionControlFactoryExample
  end #FactoryMethod
end #Creational
