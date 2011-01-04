class JobsController < ApplicationController

  load_and_authorize_resource
  
  def index
    @jobs = Job.recents
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
