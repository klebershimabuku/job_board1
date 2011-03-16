require 'spec_helper'

describe PrefecturesController do

  def mock_prefecture(stubs={})
    (@mock_prefecture ||= mock_model(Prefecture).as_null_object).tap do |prefecture|
      prefecture.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all prefectures as @prefectures" do
      Prefecture.stub(:all) { [mock_prefecture] }
      get :index
      assigns(:prefectures).should eq([mock_prefecture])
    end
  end

  describe "GET show" do
    it "assigns the requested prefecture as @prefecture" do
      Prefecture.stub(:find).with("37") { mock_prefecture }
      get :show, :id => "37"
      assigns(:prefecture).should be(mock_prefecture)
    end
  end

  describe "GET new" do
    it "assigns a new prefecture as @prefecture" do
      Prefecture.stub(:new) { mock_prefecture }
      get :new
      assigns(:prefecture).should be(mock_prefecture)
    end
  end

  describe "GET edit" do
    it "assigns the requested prefecture as @prefecture" do
      Prefecture.stub(:find).with("37") { mock_prefecture }
      get :edit, :id => "37"
      assigns(:prefecture).should be(mock_prefecture)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created prefecture as @prefecture" do
        Prefecture.stub(:new).with({'these' => 'params'}) { mock_prefecture(:save => true) }
        post :create, :prefecture => {'these' => 'params'}
        assigns(:prefecture).should be(mock_prefecture)
      end

      it "redirects to the created prefecture" do
        Prefecture.stub(:new) { mock_prefecture(:save => true) }
        post :create, :prefecture => {}
        response.should redirect_to(prefecture_url(mock_prefecture))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved prefecture as @prefecture" do
        Prefecture.stub(:new).with({'these' => 'params'}) { mock_prefecture(:save => false) }
        post :create, :prefecture => {'these' => 'params'}
        assigns(:prefecture).should be(mock_prefecture)
      end

      it "re-renders the 'new' template" do
        Prefecture.stub(:new) { mock_prefecture(:save => false) }
        post :create, :prefecture => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested prefecture" do
        Prefecture.should_receive(:find).with("37") { mock_prefecture }
        mock_prefecture.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :prefecture => {'these' => 'params'}
      end

      it "assigns the requested prefecture as @prefecture" do
        Prefecture.stub(:find) { mock_prefecture(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:prefecture).should be(mock_prefecture)
      end

      it "redirects to the prefecture" do
        Prefecture.stub(:find) { mock_prefecture(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(prefecture_url(mock_prefecture))
      end
    end

    describe "with invalid params" do
      it "assigns the prefecture as @prefecture" do
        Prefecture.stub(:find) { mock_prefecture(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:prefecture).should be(mock_prefecture)
      end

      it "re-renders the 'edit' template" do
        Prefecture.stub(:find) { mock_prefecture(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested prefecture" do
      Prefecture.should_receive(:find).with("37") { mock_prefecture }
      mock_prefecture.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the prefectures list" do
      Prefecture.stub(:find) { mock_prefecture }
      delete :destroy, :id => "1"
      response.should redirect_to(prefectures_url)
    end
  end

end
