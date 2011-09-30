# coding: utf-8
class JobsController < ApplicationController
  respond_to :html, :js

  load_and_authorize_resource
  
  def index
    @specials = Job.specials
    @jobs = Job.recents_available.page(params[:page])
    respond_with(@jobs)
  end

  def revision
    @jobs = Job.all_pending.page params[:page]
  end
  
  def locked
    @jobs = Job.all_locked.page(params[:page]).per(10)
  end

  def publish
    url = job_url(@job)
    @job = Job.find(params[:id])
    @job.publish
    @job.share(url)
    flash[:notice] = "Job was successful published."
    redirect_to jobs_revision_path
  rescue Twitter::Forbidden
    flash[:error] = "Ops! something went wrong. You probably have already tweeted it."
    redirect_to jobs_revision_path
  end

  def unpublish
    @job = Job.find(params[:id]).unpublish
    flash[:notice] = "Job was successful unpublished."
    redirect_to jobs_revision_path    
  end
  
  def lock
    Job.find(params[:id]).lock
    flash[:notice] = "Job was successful locked."
    redirect_to job_path
  end

  def unlock
    Job.find(params[:id]).unlock
    flash[:notice] = "Job was successful unlocked."
    redirect_to jobs_path
  end

  def show
    @job = Job.find(params[:id])
    @job.increase_pagehit
    @job.check_max_pagehits
    if current_user && current_user.admin? 
    elsif current_user && current_user.announcer?
      if @job.expired? 
        render :action => 'expired'
      elsif @job.locked? && !@job.expired?
      	flash[:error] = "Anúncio não disponível."
      	redirect_to jobs_path
      end
    else
    	if @job.expired?
    		render :action => 'expired'
    	elsif !@job.available or @job.locked?
        flash[:error] = "Job unavailable."
        redirect_to root_path
      end
    end
  end

  def new
    # check if the announcer has any pack plan assigned
    @account = Account.find_by_user_id(current_user)
    
    # ensure that the announcer has acquired any job pack
    #if !@account.active_pack.nil? || !@account.active_pack.blank?
    if @account.nil? || @account.blank?
			flash[:error] = "Entre em contato com o Administrador para definir um plano de anúncios."
			redirect_to(root_path)
		else
			account_types = %w(free special admin)
			
			#if @account.active_pack == 'free' || @account.active_pack == 'special' || @account.active_pack == 'admin'
			if account_types.include?(@account.active_pack)
					
				posts_limit = 999
				
				new_posts_allowed = Job.allowed?(@account, posts_limit)
				
				if new_posts_allowed
			    @job = Job.new
			    @account_id = @account.id 
			    # get the total of highlight jobs posted by this pack and see if it can still make a new highlight job
			    @highlight = Job.allow_highlight?(@account_id)
			  else
			  	flash[:error] = "Você não possui permissão para criar novos anúncios."
			  	redirect_to(root_path)
			  	
				end
				
			end

		end
				
  end

  def edit
 		@account = Job.find(params[:id]).account_id
  end

  def create
    @job = Job.new(params[:job])
    if params[:preview_button] || !@job.save
    	render :action => "new"
    elsif @job.save
      UserMailer.job_posted_announcer_notification(@job).deliver
      redirect_to(@job, :notice => 'Job was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
  	if params[:preview_button] || !@job.update_attributes(params[:job])
  		@job = params[:job]
  		render :action => "edit"  	
    elsif @job.update_attributes(params[:job])
      if current_user.announcer?
        @job.update_attribute(:available, :value => false)
      end
      UserMailer.job_updated(@job).deliver
      redirect_to(@job, :notice => 'Job was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @job.destroy
    redirect_to(jobs_url)
  end

  def feed
    @jobs = Job.feed
    respond_to do |format|
      format.atom { render :layout => false }
    end
  end

  def batatafeeds
    @jobs = Job.batata_feeds
    respond_to do |format|
      format.atom { render :layout => false }
    end
  end  
  
  def expired;   end
  
end

