class JobsController < ApplicationController

  load_and_authorize_resource

  
  def index
    @jobs = Job.recents_available
    @user = current_user
    if @user && @user.admin?
      @pending = Job.all_pending_jobs
    elsif @user && @user.announcer?
      @pending = Job.user_pending_jobs(current_user)
    end
  end

  def revision
    @pending = Job.all_pending_jobs    
  end

  def publish
    Job.find(params[:id]).toggle!(:available)
    flash[:notice] = "Job was successfull published."
    redirect_to jobs_revision_path
  end

  def unpublish
    Job.find(params[:id]).toggle!(:available)
    flash[:notice] = "Job was successfull unpublished."
    redirect_to jobs_revision_path    
  end


  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      redirect_to(@job, :notice => 'Job was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @job.update_attributes(params[:job])
      redirect_to(@job, :notice => 'Job was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @job.destroy
    redirect_to(jobs_url)
  end

end

