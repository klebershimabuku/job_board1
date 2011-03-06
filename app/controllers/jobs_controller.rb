# coding: utf-8
class JobsController < ApplicationController

  load_and_authorize_resource
   
  uses_tiny_mce :only => [:new, :create, :edit, :update], :options => {
                                                                        :theme_advanced_toolbar_location => :top,
                                                                        :theme => 'advanced',
                                                                        :cleanup_on_startup => true,
                                                                        :theme_advanced_blockformats => "p,div,h1,h2,h3,h4,h5,h6,blockquote,dt,dd,code,samp",
                                                                        :theme_advanced_buttons1 => "bold,italic,separator,undo,redo,separator,link,table,charmap",
                                                                        :theme_advanced_buttons2 => "",
                                                                        :theme_advanced_toolbar_align => "left",
                                                                        :convert_newlines_to_brs => true,
                                                                        :force_br_newlines => true,
                                                                        :force_p_newlines => false,
                                                                        :forced_root_block => '' # Needed for 3.x
                                                                      }

	
  PER_PAGE = 50
  
  def index
    @jobs = Job.recents_available.paginate :page => params[:page], :per_page => PER_PAGE
  end

  def revision
    @jobs = Job.all_pending.paginate :page => params[:page], :per_page => PER_PAGE
  end
  
  def locked
    @jobs = Job.all_locked.paginate :page => params[:page], :per_page => PER_PAGE
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
    redirect_to 'http://feeds.feedburner.com/Shigotodoko', :status=>307 and return unless request.env['HTTP_USER_AGENT'].match(/feedburner|feedvalidator/i)
    @jobs = Job.feed
    respond_to do |format|
      format.atom
    end
  end
  
  def expired;   end
  
end

