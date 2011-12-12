#encoding: utf-8
require 'spec_helper'

describe Job do


  it { should validate_presence_of(:title) }
  
  it { should validate_presence_of(:content) }
  
  it { should validate_presence_of(:location) }
  
  it { should validate_presence_of(:company_name) }
  
  it { should validate_presence_of(:how_to_apply) }
  
  it { should validate_presence_of(:highlight) }
  
  it { should ensure_length_of(:title).is_at_most(50) }

  it { should ensure_length_of(:content).is_at_most(2000) }

  it { should ensure_length_of(:how_to_apply).is_at_most(160) }
  
  it { should belong_to(:user) }
   
  before(:each) do
    @attr = {
      :title => "Contrata-se para fabrica de autos",
      :content => "Estamos contratando pessoas interessadas em trabalhar em fabrica de autos",
      :location => "Aichi-ken, Toyohashi-shi",
      :company_name => "K.K. Test",
      :company_website => "http://www.test.com",
      :how_to_apply => "Enviar email para contato@test.com",
      :user_id => 1
    }
  end  
  
  it "should create a new instance given valid attributes" do
    Job.create!(@attr)
  end
  
  it "should accept valid urls" do
    valid_url = %w[http://www.shigotodoko.com http://shigotodoko.com https://www.shigotodoko.com http://www.shigotodoko.jp]
    valid_url.each do |url|
      job = Job.new(@attr.merge(:company_website => url))
      job.should be_valid
    end 
  end
  
  it "should reject invalid urls" do
    invalid_url = %w[htt://www.shigotodoko.com site.com htp://site http://www.site,com http://www..site.com]
    invalid_url.each do |url|
      job = Job.new(@attr.merge(:company_website => url))
      job.should_not be_valid
    end
  end
  
  # testing scopes
  
  describe Job, ":recents_available" do

    it "should have the scope" do
      Job.should respond_to(:recents_available)
    end
    
    it "should be in the reverse order of appering" do
      @job1 = Factory(:job, :available => true, :locked => false, :created_at => 1.day.ago)
      @job2 = Factory(:job, :available => true, :locked => false, :created_at => 1.hour.ago)
      Job.recents_available.should == [@job2, @job1]
    end

    it "should not include jobs that are unavailable" do
      @job = Factory(:job, :available => false)
      Job.recents_available.should_not == @job
    end

    it "should not include jobs that are locked" do
      @job = Factory(:job, :locked => true)
      Job.recents_available.should_not == @job
    end

  end

  describe Job, "scopes" do

    it "should have the scope" do
      Job.should respond_to(:user_pending)
    end

    it "should return a list of jobs that are unavailable for the current_user" do
      @user = Factory(:user, :id => 1)
      @job = Factory(:job, :available => false, :user_id => @user)
      Job.user_pending(@user).first.should == @job
    end

    it "should have the 'all_pending scope'" do
      Job.should respond_to(:all_pending)
    end

    it "should return all pending jobs" do
      @job = Factory(:job, :available => false)
      Job.all_pending.first.should == @job
    end

    it "should not return pending jobs" do
      @job = Factory(:job, :available => true)
      Job.all_pending.first.should_not == @job
    end

    it "should have the 'all_locked scope'" do
      Job.should respond_to(:all_locked)
    end

    it "should return locked jobs" do
      @job = Factory(:job, :locked => true)
      Job.all_locked.first.should == @job
    end

    it "should not return locked jobs" do
      @job = Factory(:job, :locked => false)
      Job.all_locked.first.should_not == @job
    end

  end

  describe "publish process" do
  	
  	before(:each) do
  		@user = Factory(:account, :active_pack => 'free')
  	end
  	
    it "should publish a job" do
      @job = Factory(:job, :available => false, :locked => false)
      lambda { @job.publish }.should change(@job, :available).from(false).to(true)
    end

    it "should not publish a locked job" do
      @job = Factory(:job, :available => false, :locked => true)
      lambda { @job.publish }.should_not change(@job, :available).from(false).to(true)
    end
  end

  describe "unpublish process" do
    it "should unpublish a job" do
      @job = Factory(:job, :available => true)
      lambda { @job.unpublish }.should change(@job, :available).from(true).to(false)
    end
  end

  describe "#lock" do
    it "should lock a job" do
      @job = Factory(:job, :locked => false)
      lambda { @job.lock }.should change(@job, :locked).from(false).to(true)
    end
  end

  describe "#unlock" do
    it "should unlock a job" do
      @job = Factory(:job, :locked => true)
      lambda { @job.unlock }.should change(@job, :locked).from(true).to(false)
    end
  end

  it "should increment the visits counter by 1 if the job is already available" do
	  @job = Factory(:job, :available => true)
  	lambda { @job.increase_pagehit }.should change(@job, :visits).by(1)
  end
  
  it "should not change the updated date after the increment pagehit process" do
  	@job = Factory(:job, :available => true)
  	@previous_date = @job.updated_at
  	@job.increase_pagehit
  	@job.updated_at.should == @previous_date
  end
  
  it "should expire a job immediately and save the date" do
  	@job = Factory(:job, :expired => false, :expired_at => nil)
  	@job.expire!
  	@job.expired_at = Time.now
  	@job.expired_at.should_not be_nil
  	@job.expired.should be_true
  end
	
	it "should allow user to create new jobs until reach the limit" do
		jobs_posted = 1
		limit = 3
		if jobs_posted < limit
			Job.allowed?(1,3).should be_true
		end
	end
	
	it "should deny user to create new jobs when reach the limit" do
		jobs_posted = 3
		limit = 3
		if jobs_posted < limit
			Job.allowed(1,3).should be_false
		end
	end

	it "should return all published jobs that are not locked" do
		@job = Factory(:job, :available => true, :locked => false)
		Job.published.first.should == @job
	end
	
	it "should return all jobs in revision estate" do
		@job = Factory(:job, :available => false, :locked => false)
		Job.revision.first.should == @job
	end
	
	it "should return all expired jobs" do
		@job = Factory(:job, :expired => true)
		Job.expired.first.should == @job
	end
	
	describe Job, "Checking max pagehits" do
		it "should expire and lock jobs for free active_pack when it reaches the 500 of limit pagehit" do
			@job = Factory(:job, :visits => 501)
			@account = Factory(:account, :active_pack => 'free')
			@job.check_max_pagehits
			@job.locked.should be_true
			@job.expired.should be_true		
		end
	
		it "should expire and lock jobs for special active_pack when it reaches the 100.000 of limit pagehit" do
			@job = Factory(:job, :visits => 100001)
			@account = Factory(:account, :active_pack => 'special')
			@job.check_max_pagehits
			@job.locked.should be_true
			@job.expired.should be_true		
		end
	end
	
	it "should return all jobs created by an announcer and the display order should be descendant" do
		@job1 = Factory(:job, :id => 1)
		@job2 = Factory(:job, :id => 2)
		Job.announcer_total_jobs(1).should == [@job2, @job1]
	end
	
	it "should allow announcer to create highlight posts" do
		@account = Factory(:account, :id => 1, :active_pack => 'free')
		@highlighted_jobs = 1
		@allowed = 3
		if @highlighted_jobs < @allowed
			Job.allow_highlight?(1).should be_true
		end
	end
	
	it "should deny announcer to create highlight posts" do
		@account = Factory(:account, :id => 1, :active_pack => 'free')
		@highlighted_jobs = 3
		@allowed = 3
		if @highlighted_jobs < @allowed
			Job.allow_highlight?(1).should be_false
		end
	end
	
	it "should return the quantity of hightlighted created posts by an announcer" do
		@job1 = Factory(:job, :account_id => 1, :highlight => true)
		@job2 = Factory(:job, :account_id => 1, :highlight => true)
		@job3 = Factory(:job, :account_id => 1, :highlight => false)
		Job.total_account_highlight(1).should be_equal(2)
	end
	
	it "should display the visits average for published posts" do
		@job = Factory(:job, :published_at => 1.day.ago, :visits => 100)
		@job.visits_average('day').should be_equal(50)
	end
	
	it "should display an error message if the post have not been published yet" do
		@job = Factory(:job, :published_at => nil)
		@job.visits_average('day').should == "Média não disponível."		
	end
	
end
