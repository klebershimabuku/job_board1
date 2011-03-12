require "spec_helper"

describe AgenciesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/agencies" }.should route_to(:controller => "agencies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/agencies/new" }.should route_to(:controller => "agencies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/agencies/1" }.should route_to(:controller => "agencies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/agencies/1/edit" }.should route_to(:controller => "agencies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/agencies" }.should route_to(:controller => "agencies", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/agencies/1" }.should route_to(:controller => "agencies", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/agencies/1" }.should route_to(:controller => "agencies", :action => "destroy", :id => "1")
    end

  end
end
