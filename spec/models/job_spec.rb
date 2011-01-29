require 'spec_helper'

describe Job do

  before(:each) do
    @attr = {
      :title => "Contrata-se urgente",
      :content => "Estamos contratando urgente pessoas para trabalhar em fabrica de autos em Aichi-ken.",
      :location => "Aichi-ken Toyohashi-shi",
      :company_name => "K.K. Test Group.",
      :company_website => "http://www.test.com/",
      :how_to_apply => "Enviar email para contact@test.com"
    }
  end  
  
  it "should create a new instance given a valid attributes" do
    Job.create!(@attr)
  end
  
  it "should require a title" do
    job = Job.new(@attr.merge(:title => ''))
    job.should_not be_valid
  end
  
  it "should require a content" do
    job = Job.new(@attr.merge(:content => ''))
    job.should_not be_valid
  end
  
  it "should require a location" do
    job = Job.new(@attr.merge(:location => ''))
    job.should_not be_valid
  end
  
  it "should require a company_name" do
    job = Job.new(@attr.merge(:company_name => ''))
    job.should_not be_valid
  end
  
  it "should require a how to apply" do
    job = Job.new(@attr.merge(:how_to_apply => ''))
    job.should_not be_valid
  end

end
