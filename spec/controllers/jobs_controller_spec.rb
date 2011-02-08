require 'spec_helper'

describe JobsController do
  
  context 'should validates the controller' do
    it { JobsController.new.should be_an_instance_of(JobsController) }
  end
  
end
