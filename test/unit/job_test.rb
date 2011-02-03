require 'test_helper'


class JobTest < ActiveSupport::TestCase

  describe Job do
    it { should validate_presence_of :title }    
  end
end
