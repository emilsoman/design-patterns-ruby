require 'spec_helper'
require 'creational/builder/email_builder'
module Creational::Builder::EmailBuilderExample
  describe Application do
    describe "#run" do
      let(:application) {Application.new}
      context "when creating email with Welcome template" do
        let(:email_template) { WelcomeEmail.new  }
        context "when using DarkEmail builder" do
          let(:email_builder) { DarkEmailBuilder.new }
          it "should get a dark themed email" do
            STDOUT.should_receive(:puts).with("dark welcome, dark body, dark footer")
            application.send_welcome_mail(email_builder)
          end
        end
        context "when using WhiteEmail builder" do
          let(:email_builder) { WhiteEmailBuilder.new }
          it "should get a white themed email" do
            STDOUT.should_receive(:puts).with("white welcome, white body, white footer")
            application.send_welcome_mail(email_builder)
          end
        end
      end
      context "when creating email with Alert template" do
        let(:email_template) { AlertEmail.new  }
        context "when using DarkEmail builder" do
          let(:email_builder) { DarkEmailBuilder.new }
          it "should get a dark themed email" do
            STDOUT.should_receive(:puts).with("dark alert, dark body, dark footer")
            application.send_alert_mail(email_builder)
          end
        end
        context "when using WhiteEmail builder" do
          let(:email_builder) { WhiteEmailBuilder.new }
          it "should get a white themed email" do
            STDOUT.should_receive(:puts).with("white alert, white body, white footer")
            application.send_alert_mail(email_builder)
          end
        end
      end
    end
  end
  describe EmailBuilder do
    class TestBuilder < EmailBuilder
      def initialize;end
    end
    class TestBuilderWithoutInitialize < EmailBuilder; end
    describe "#new" do
      it "should be an abstract method" do
        expect{EmailBuilder.new}.to raise_error(NotImplementedError, "#{EmailBuilder.name} does not implement initialize()")
        expect{TestBuilderWithoutInitialize.new}.to raise_error(NotImplementedError, "#{TestBuilderWithoutInitialize.name} does not implement initialize()")
      end
    end
    describe "#set_subject" do
      it "should be an abstract method" do
        test_builder = TestBuilder.new
        expect{test_builder.set_subject}.to raise_error(NotImplementedError, "#{test_builder.class.name} does not implement set_subject()")
      end
    end
    describe "#set_body" do
      it "should be an abstract method" do
        test_builder = TestBuilder.new
        expect{test_builder.set_body}.to raise_error(NotImplementedError, "#{test_builder.class.name} does not implement set_body()")
      end
    end
    describe "#set_footer" do
      it "should be an abstract method" do
        test_builder = TestBuilder.new
        expect{test_builder.set_footer}.to raise_error(NotImplementedError, "#{test_builder.class.name} does not implement set_footer()")
      end
    end
  end
end
