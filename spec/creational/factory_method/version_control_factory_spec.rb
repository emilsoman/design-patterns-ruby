require 'spec_helper'
require 'creational/factory_method/version_control_factory'
module Creational::FactoryMethod::VersionControlFactoryExample
  describe Application do
    describe "#run" do
      let(:application) {Application.new(version_control)}
      context "when GuiFactory is an instance of WinFactory" do
        let(:version_control) { 'git' }
        it "should use Git" do
          STDOUT.should_receive(:puts).with("Using Git to clone project")
          application.run
        end
      end
      context "when GuiFactory is an instance of OsxFactory" do
        let(:version_control) { 'svn' }
        it "should use Svn" do
          STDOUT.should_receive(:puts).with("Using Svn to checkout project")
          application.run
        end
      end
    end
  end

  describe VersionControlFactory do
    describe "#create_version_control" do
      let(:version_control_object) { VersionControlFactory.create_version_control(version_control) }
      context "when type is svn" do
        let(:version_control) {'svn'}
        it "should return an object of SvnVersionControl" do
          version_control_object.should be_an_instance_of SvnVersionControl
        end
      end
      context "when type is git" do
        let(:version_control) {'git'}
        it "should return an object of GitVersionControl" do
          version_control_object.should be_an_instance_of GitVersionControl
        end
      end
      context "when type is unknown" do
        let(:version_control) {'unknown'}
        it "should return an object of SvnVersionControl" do
          version_control_object.should be_nil
        end
      end
    end
  end
end
