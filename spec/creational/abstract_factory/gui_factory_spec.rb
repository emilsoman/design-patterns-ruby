require 'spec_helper'
require 'creational/abstract_factory/gui_factory'
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
      expect{gui_factory.create_button}.to raise_error(NotImplementedError, "GuiFactory does not implement create_button()")
      expect{test_factory.create_button}.to raise_error(NotImplementedError, "TestFactory does not implement create_button()")
    end
  end
end

describe AbstractButton do
  describe "#paint" do
    it "should be an abstract method" do
      gui_factory = AbstractButton.new
      class TestButton < AbstractButton; end
      test_button = TestButton.new
      expect{gui_factory.paint}.to raise_error(NotImplementedError, "AbstractButton does not implement paint()")
      expect{test_button.paint}.to raise_error(NotImplementedError, "TestButton does not implement paint()")
    end
  end
end
