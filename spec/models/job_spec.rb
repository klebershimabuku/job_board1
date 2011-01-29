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
  
end
