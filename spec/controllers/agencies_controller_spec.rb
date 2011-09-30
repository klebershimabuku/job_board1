require 'spec_helper'

describe AgenciesController do

  render_views
  
  def mock_agency(stubs={})
    (@mock_agency ||= mock_model(Agency).as_null_object).tap do |agency|
      agency.stub(stubs) unless stubs.empty?
    end
  end
  
  def mock_province(stubs={})
    (@mock_province ||= mock_model(Province).as_null_object).tap do |province|
      province.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all provinces as @provinces" do
      Province.stub(:all) { [mock_province] }
      get :index
      assigns(:provinces).should eq([mock_province])
    end
  end

  describe "GET show" do
    it "assigns the requested agency as @agency" do
      Province.stub(:find).with("8") { mock_province }
      Agency.stub(:find_all_by_province_id).with("8") { mock_agency }
      get :show, :id => "8"
      assigns(:agencies).should be(mock_agency)
      assigns(:province).should be(mock_province)
    end
  end

  describe "GET new" do
    it "assigns a new agency as @agency" do
      Agency.stub(:new) { mock_agency }
      get :new
      assigns(:agency).should be(mock_agency)
    end
  end

  describe "GET edit" do
    it "assigns the requested agency as @agency" do
      Agency.stub(:find).with("37") { mock_agency }
      get :edit, :id => "37"
      assigns(:agency).should be(mock_agency)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created agency as @agency" do
        Agency.stub(:new).with({'these' => 'params'}) { mock_agency(:save => true) }
        post :create, :agency => {'these' => 'params'}
        assigns(:agency).should be(mock_agency)
      end

      it "redirects to the created agency" do
        Agency.stub(:new) { mock_agency(:save => true) }
        post :create, :agency => {}
        response.should redirect_to(agency_url(mock_agency))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved agency as @agency" do
        Agency.stub(:new).with({'these' => 'params'}) { mock_agency(:save => false) }
        post :create, :agency => {'these' => 'params'}
        assigns(:agency).should be(mock_agency)
      end

      it "re-renders the 'new' template" do
        Agency.stub(:new) { mock_agency(:save => false) }
        post :create, :agency => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested agency" do
        Agency.should_receive(:find).with("37") { mock_agency }
        mock_agency.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :agency => {'these' => 'params'}
      end

      it "assigns the requested agency as @agency" do
        Agency.stub(:find) { mock_agency(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:agency).should be(mock_agency)
      end

      it "redirects to the agency" do
        Agency.stub(:find) { mock_agency(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(agency_url(mock_agency))
      end
    end

    describe "with invalid params" do
      it "assigns the agency as @agency" do
        Agency.stub(:find) { mock_agency(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:agency).should be(mock_agency)
      end

      it "re-renders the 'edit' template" do
        Agency.stub(:find) { mock_agency(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested agency" do
      Agency.should_receive(:find).with("37") { mock_agency }
      mock_agency.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the agencies list" do
      Agency.stub(:find) { mock_agency }
      delete :destroy, :id => "1"
      response.should redirect_to(agencies_url)
    end
  end

end
