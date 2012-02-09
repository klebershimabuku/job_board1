
#
# Specifying rufus-scheduler
#
# Sat Mar 21 20:19:30 JST 2009
#

require File.join(File.dirname(__FILE__), 'spec_base')


describe "#{SCHEDULER_CLASS}#schedule_at" do

  before(:each) do
    @s = start_scheduler
  end
  after(:each) do
    stop_scheduler(@s)
  end

  it 'has job ids with the class name in it' do

    j0 = @s.at(Time.now + 1) {}
    j0.job_id.should match(/Rufus::Scheduler::AtJob/)
  end

  it "accepts integers as 'at'" do

    lambda { @s.at(1) {} }.should_not raise_error
  end

  it "schedules at 'top + 1'" do

    var = nil

    @s.at Time.now + 1 do
      var = true
    end

    var.should == nil
    sleep 1.5

    var.should == true
    @s.jobs.should == {}
  end

  it 'triggers immediately jobs in the past' do

    var = nil

    j = @s.at Time.now - 2 do
      var = true
    end

    j.should_not == nil

    #wait_next_tick
    sleep 0.500

    var.should == true
    @s.jobs.should == {}
  end

  it 'unschedules' do

    job = @s.at Time.now + 3 * 3600 do
    end

    wait_next_tick

    @s.jobs.size.should == 1

    @s.unschedule(job.job_id)

    @s.jobs.size.should == 0
  end

  it 'accepts tags for jobs' do

    job = @s.at Time.now + 3 * 3600, :tags => 'spec' do
    end

    wait_next_tick

    @s.find_by_tag('spec').size.should == 1
    @s.find_by_tag('spec').first.job_id.should == job.job_id
  end
end

describe Rufus::Scheduler::AtJob do

  before do
    @s = start_scheduler
  end
  after do
    stop_scheduler(@s)
  end

  it 'unschedules itself' do

    job = @s.at Time.now + 3 * 3600 do
    end

    wait_next_tick

    job.unschedule

    @s.jobs.size.should == 0
  end

  it 'responds to #next_time' do

    t = Time.now + 3 * 3600

    job = @s.at Time.now + 3 * 3600 do
    end

    job.next_time.to_i.should == t.to_i
  end
end

