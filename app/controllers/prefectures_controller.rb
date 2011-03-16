class PrefecturesController < ApplicationController
  load_and_authorize_resource

  # GET /prefectures
  # GET /prefectures.xml
  def index
    @prefectures = Prefecture.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prefectures }
    end
  end

  # GET /prefectures/1
  # GET /prefectures/1.xml
  def show
    @prefecture = Prefecture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prefecture }
    end
  end

  # GET /prefectures/new
  # GET /prefectures/new.xml
  def new
		@provinces = Province.all
    @prefecture = Prefecture.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prefecture }
    end
  end

  # GET /prefectures/1/edit
  def edit
    @prefecture = Prefecture.find(params[:id])
  end

  # POST /prefectures
  # POST /prefectures.xml
  def create
    @prefecture = Prefecture.new(params[:prefecture])

    respond_to do |format|
      if @prefecture.save
        format.html { redirect_to(@prefecture, :notice => 'Prefecture was successfully created.') }
        format.xml  { render :xml => @prefecture, :status => :created, :location => @prefecture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prefecture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prefectures/1
  # PUT /prefectures/1.xml
  def update
    @prefecture = Prefecture.find(params[:id])

    respond_to do |format|
      if @prefecture.update_attributes(params[:prefecture])
        format.html { redirect_to(@prefecture, :notice => 'Prefecture was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prefecture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prefectures/1
  # DELETE /prefectures/1.xml
  def destroy
    @prefecture = Prefecture.find(params[:id])
    @prefecture.destroy

    respond_to do |format|
      format.html { redirect_to(prefectures_url) }
      format.xml  { head :ok }
    end
  end
end
