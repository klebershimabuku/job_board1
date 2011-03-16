require "spec_helper"

describe PrefecturesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/prefectures" }.should route_to(:controller => "prefectures", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/prefectures/new" }.should route_to(:controller => "prefectures", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/prefectures/1" }.should route_to(:controller => "prefectures", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/prefectures/1/edit" }.should route_to(:controller => "prefectures", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/prefectures" }.should route_to(:controller => "prefectures", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/prefectures/1" }.should route_to(:controller => "prefectures", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/prefectures/1" }.should route_to(:controller => "prefectures", :action => "destroy", :id => "1")
    end

  end
end
