require 'spec_helper'
require 'creational/abstract_factory/gui_factory'
module Creational::AbstractFactory::GuiFactoryExample
  describe Application do
    describe "#run" do
      let(:application) {Application.new(gui_factory)}
      context "when GuiFactory is an instance of WinFactory" do
        let(:gui_factory) { WinFactory.new }
        it "should use WinButton to paint" do
          STDOUT.should_receive(:puts).with("I'm a WinButton")
          application.run
        end
      end
      context "when GuiFactory is an instance of OsxFactory" do
        let(:gui_factory) { OsxFactory.new }
        it "should use OsxButton to paint" do
          STDOUT.should_receive(:puts).with("I'm an OsxButton")
          application.run
        end
      end
    end
  end

  describe GuiFactory do
    describe "#create_button" do
      it "should be an abstract method" do
        gui_factory = GuiFactory.new
        class TestFactory < GuiFactory; end
        test_factory = TestFactory.new
        expect{gui_factory.create_button}.to raise_error(NotImplementedError, "#{gui_factory.class.name} does not implement create_button()")
        expect{test_factory.create_button}.to raise_error(NotImplementedError, "#{test_factory.class.name} does not implement create_button()")
      end
    end
  end

  describe AbstractButton do
    describe "#paint" do
      it "should be an abstract method" do
        abstract_button = AbstractButton.new
        class TestButton < AbstractButton; end
        test_button = TestButton.new
        expect{abstract_button.paint}.to raise_error(NotImplementedError, "#{abstract_button.class.name} does not implement paint()")
        expect{test_button.paint}.to raise_error(NotImplementedError, "#{test_button.class.name} does not implement paint()")
      end
    end
  end
end
