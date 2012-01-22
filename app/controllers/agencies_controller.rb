class AgenciesController < ApplicationController
  load_and_authorize_resource
  # GET /agencies
  # GET /agencies.xml
  def index
    @provinces = Province.all
  end

  # GET /agencies/1
  # GET /agencies/1.xml
  def show
  	@province = Province.find(params[:id])
    @agencies = Agency.find_all_by_province_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agencies }
    end
  end

  # GET /agencies/new
  # GET /agencies/new.xml
  def new
		@provinces = Province.find(:all)
    @agency = Agency.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agency }
    end
  end

  # GET /agencies/1/edit
  def edit
		@provinces = Province.find(:all)
    @agency = Agency.find(params[:id])
  end

  # POST /agencies
  # POST /agencies.xml
  def create
    @agency = Agency.new(params[:agency])

    respond_to do |format|
      if @agency.save
      	session[:province_id] = @agency[:province_id]
        format.html { redirect_to(new_agency_path, :notice => 'Agency was successfully created.') }
        format.xml  { render :xml => @agency, :status => :created, :location => @agency }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /agencies/1
  # PUT /agencies/1.xml
  def update
    @agency = Agency.find(params[:id])

    respond_to do |format|
      if @agency.update_attributes(params[:agency])
        format.html { redirect_to(agencies_path, :notice => 'Agency was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.xml
  def destroy
    @agency = Agency.find(params[:id])
    @agency.destroy

    respond_to do |format|
      format.html { redirect_to(agencies_url) }
      format.xml  { head :ok }
    end
  end
  
  def info
  end
  
 end
