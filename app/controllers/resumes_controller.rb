class ResumesController < ApplicationController

  load_and_authorize_resource
	
	def index
		@search = Resume.search params[:search]
		@resumes = @search.order("created_at DESC").page params[:page]
	end
	
	def show
		@resume = Resume.find(params[:id])
		@hits = @resume.hits.blank? ? 0 : @resume.hits
		@resume.update_attribute(:hits, @hits+1)
	end
	
  def new
  	@resume = Resume.new
  end
  
  def create
  	@resume = Resume.new(params[:resume])
  	
    @marital_status = @resume.marital_status
    @birthday = @resume.birthday
    @selected_state = @resume.province_id
    @working = @resume.working
    @possible_moving = @resume.possible_moving
    @children = @resume.children
    @gender = @resume.gender
    @piercing = @resume.piercing
    @tatoo = @resume.tattoo
    @vehicle = @resume.vehicle
    @descendencia = @resume.origin

  	if @resume.save
  		redirect_to(resume_path(@resume), :notice => "Curriculum criado com sucesso.")
  	else
  		render :action => "new"
  	end
  end
  
  def edit
  	@resume = Resume.find(params[:id])
    @marital_status = @resume.marital_status
    @birthday = @resume.birthday
    @selected_state = @resume.province_id
    @working = @resume.working
    @possible_moving = @resume.possible_moving
    @children = @resume.children
    @gender = @resume.gender
    @piercing = @resume.piercing
    @tattoo = @resume.tattoo
    @vehicle = @resume.vehicle
    @descendencia = @resume.origin  	
  end
  
  def update
  	@resume = Resume.find(params[:id])
  	if @resume.update_attributes(params[:resume])
  		redirect_to(resume_path(@resume), :notice => "Curriculum salvo.")
  	else
  		render :action => "edit"
  	end
  end
  
  def destroy
  	
  end
  
end
