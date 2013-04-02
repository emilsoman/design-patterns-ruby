module Creational
  module Builder
    # This example demonstrates the Builder pattern
    # using classes for an Email content generator.
    #
    # [Problem] There is a an application which needs to generate different
    #           types of emails, say welcome mail or alert mail. There needs
    #           to be a way to pick different themes for the same email template.
    #           If there are going to be conditionals inside the template classes
    #           to create the email template in each theme, it's going to get messy
    #           soon when we have lots of email templates and many more themes.
    #
    # [Solution] Use Builder pattern to separate creation steps and
    #            internal representations of complex objects created.
    #            Here it means separating the blueprint for creating each
    #            type of email template from what theme is used in the email
    #            template to create the elements of the email, say subject,
    #            body and footer. Thus, any type of theme can be used by
    #            any email template, provided all themes have the same
    #            interface to create the subject, body and footer of
    #            the email.
    # [Collaborators]
    #           AbstractBuilder:: {EmailBuilder}
    #           ConcreteBuilder:: {DarkEmailBuilder}, {WhiteEmailBuilder}
    #           Director:: {WelcomeEmail}, {AlertEmail}
    #           Product:: {Email}
    #           Client:: {Application}
    module EmailBuilderExample

      # [Role] AbstractBuilder
      # You don't really need this in Ruby thanks to duck typing.
      # But we'll make sure every subclass implements the instance methods.
      # Notice the NotImplementedError?
      # That makes sure every subclass of EmailBuilder overrides its methods,
      # else it raises a NotImplemented error
      class EmailBuilder
        attr_accessor :email
        def initialize
          @email = Email.new
        end
        def set_subject
          raise NotImplementedError, "#{self.class.name} does not implement set_subject()"
        end
        def set_body
          raise NotImplementedError, "#{self.class.name} does not implement set_body()"
        end
        def set_footer
          raise NotImplementedError, "#{self.class.name} does not implement set_footer()"
        end
      end

      # [Role] ConcreteBuilder
      # It implements the operations to create
      # a Dark themed email object
      # It should override all methods declared
      # in EmailBuilder
      class DarkEmailBuilder < EmailBuilder
        def set_subject(content)
          content = "dark #{content}"
          @email.subject = content
        end
        def set_body(content)
          content = "dark #{content}"
          @email.body = content
        end
        def set_footer(content)
          content = "dark #{content}"
          @email.footer = content
        end
      end

      # [Role] ConcreteBuilder
      # It implements the operations to create
      # a White themed email object
      # It should override all methods declared
      # in EmailBuilder
      class WhiteEmailBuilder < EmailBuilder
        def set_subject(content)
          content = "white #{content}"
          @email.subject = content
        end
        def set_body(content)
          content = "white #{content}"
          @email.body = content
        end
        def set_footer(content)
          content = "white #{content}"
          @email.footer = content
        end
      end

      # [Role] Director
      # WelcomeEmail uses the interfaces provided
      # by the Builder to create the welcome email
      class WelcomeEmail
        def initialize(builder)
          @builder = builder
        end
        def create_email
          @builder.set_subject('welcome')
          @builder.set_body('body')
          @builder.set_footer('footer')
        end
      end

      # [Role] Director
      # AlertEmail uses the interfaces provided
      # by the Builder to create the alert email
      class AlertEmail
        def initialize(builder)
          @builder = builder
        end
        def create_email
          @builder.set_subject('alert')
          @builder.set_body('body')
          @builder.set_footer('footer')
        end
      end

      # [Role] Product
      # This is the complex object
      # that the builders create.
      # Each builder can build a different type of object
      # but we'll just build an Email for simplicity's sake
      class Email
        attr_accessor :subject, :body, :footer
        def to_s
          [subject, body, footer].join(', ')
        end
      end

      # [Role] Client
      # It uses only those interfaces provided by
      # the Director to create an email
      class Application
        def send_welcome_mail(theme)
          welcome_email = WelcomeEmail.new(theme)
          welcome_email.create_email
          puts theme.email.to_s
        end
        def send_alert_mail(theme)
          alert_email = AlertEmail.new(theme)
          alert_email.create_email
          puts theme.email.to_s
        end
      end

    end #EmailBuilderExample
  end #Builder
end #Creational
