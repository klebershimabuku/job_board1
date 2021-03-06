require 'spec_helper'

describe User do
  
  before(:each) do
    let(:user) { FactoryGirl.create(:user) }
  end

  it "should reject duplicate email addresses" do
    user_with_duplicate_email = FactoryGirl.create(:user) 
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should change the user type from normal user type to announcer type" do
  	user.announcer.should be_false
  	user.change_level
  	user.announcer.should be_true
 	end

	it "should change the user type from announcer to normal" do
		user.announcer = true
		user.change_level
		user.announcer.should_not be_true
	end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 21
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end
  
end
