#encoding: utf-8
class ResumesController < ApplicationController

  load_and_authorize_resource
	
	def index
		@resume = Resume.find_by_user_id(current_user)
		if @resume
			render :action => :show
		end
	end
	
	def list
		@resumes = Resume.find(:all)
		@search = Resume.search params[:search]
		@resumes = @search.order("created_at DESC").page params[:page]
	end
	
	def show
		@resume = Resume.find(params[:id])
		@resume.increment_counter
	end
	
  def new
  	@resume = Resume.new
  	@provinces = Province.find(:all)
  end
  
  def create
  	@provinces = Province.find(:all)
  	@resume = Resume.create(params[:resume])
  	
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
  		redirect_to(resume_path(@resume), :notice => "Curriculo criado com sucesso.")
  	else
  		render :action => "new"
  	end
  end
  
  def edit
  	@resume = Resume.find(params[:id])
  	@provinces = Province.find(:all)
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
  		redirect_to(resume_path(@resume), :notice => "Curriculo salvo.")
  	else
  		render :action => "edit"
  	end
  end
  
  def destroy
  	@resume.destroy
  	redirect_to(resumes_path, :notice => "Currículo apagado com sucesso.")
  end
  
end
