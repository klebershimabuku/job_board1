class JobsController < ApplicationController

  load_and_authorize_resource
  PER_PAGE = 50
  
  def index
    @jobs = Job.recents_available.paginate :page => params[:page], :per_page => PER_PAGE
    @dekablog_jobs = Dekapower.recents
    @user = current_user
    if @user && @user.admin?
      @pending = Job.all_pending
    elsif @user && @user.announcer?
      @pending = Job.user_pending(current_user)
    end
  end

  def revision
    @jobs = Job.all_pending.paginate :page => params[:page], :per_page => PER_PAGE
  end
  
  def locked
    @jobs = Job.all_locked.paginate :page => params[:page], :per_page => PER_PAGE
  end

  def publish
    @job = Job.find(params[:id])
    @job.update_attributes(:available => true, :locked => false)
    url = job_url(@job)
    @job.tweet(url)
    flash[:notice] = "Job was successful published."
    redirect_to jobs_revision_path
  rescue Twitter::Forbidden
    flash[:error] = "Ops! something went wrong. You probably have already tweeted it."
    redirect_to jobs_revision_path
    
  end

  def unpublish
    @job = Job.find(params[:id])
    @job.update_attribute(:available, false)
    flash[:notice] = "Job was successful unpublished."
    redirect_to jobs_revision_path    
  end
  
  def lock
    Job.find(params[:id]).toggle!(:locked)
    flash[:notice] = "Job was successful locked."
    redirect_to job_path
  end

  def unlock
    Job.find(params[:id]).toggle!(:locked)
    flash[:notice] = "Job was successful unlocked."
    redirect_to jobs_path
  end

  def show
    @jobs = Job.find(params[:id])
    if current_user && current_user.admin? 
    elsif current_user && current_user.announcer?
      if @jobs.locked?
        flash[:error] = "Job unavailable."
        redirect_to root_path
      end
    else
      if !@jobs.available or @jobs.locked?
        flash[:error] = "Job unavailable."
        redirect_to root_path
      end
    end
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
      if current_user.announcer?
        @job.update_attribute(:available, :value => false)
      end
      redirect_to(@job, :notice => 'Job was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @job.destroy
    redirect_to(jobs_url)
  end

  private
    def feed
      redirect_to 'http://feeds.feedburner.com/Shigotodoko', :status=>307 and return unless request.env['HTTP_USER_AGENT'].match(/feedburner|feedvalidator/i)
      @jobs = Job.feed
      respond_to do |format|
        format.atom
      end
    end
  
end

