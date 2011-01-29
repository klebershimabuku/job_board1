require 'spec_helper'

describe Job do
  
  before(:each) do
    @attr = {
      :title => "Contrata-se para fabrica de autos",
      :content => "Estamos contratando pessoas interessadas em trabalhar em fabrica de autos",
      :location => "Aichi-ken, Toyohashi-shi",
      :company_name => "K.K. Test",
      :company_website => "http://www.test.com",
      :how_to_apply => "Enviar email para contato@test.com"
    }
  end  
  
  it "should require a title" do
    job = Job.new(@attr.merge(:title => ''))
    job.should_not be_valid
  end
  
end
