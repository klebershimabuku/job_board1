require 'spec_helper'

describe Resume do
	
	it { should validate_presence_of(:name) }
	
	it { should validate_presence_of(:lastname) }
	
	it { should validate_presence_of(:birthday) }
	
	it { should validate_presence_of(:marital_status) }
	
	it { should validate_presence_of(:address) }
	
	it { should validate_presence_of(:city) }
	
	it { should validate_presence_of(:phone_number) }
	
	it { should validate_presence_of(:possible_moving) }
	
	it { should validate_presence_of(:children) }
	
	it { should validate_presence_of(:qualities) }
	
	it { should validate_presence_of(:notes) }
	
	it { should validate_presence_of(:gender) }
	
	it { should validate_presence_of(:height) }
	
	it { should validate_presence_of(:weight) }
	
	it { should validate_presence_of(:origin) }
	
	it { should validate_presence_of(:piercing) }
	
	it { should validate_presence_of(:tattoo) }
	
	it { should validate_presence_of(:vehicle) }
	
	it { should validate_presence_of(:japanese_level) }

	it { should belong_to(:user) }
	
  it { should have_and_belong_to_many(:provinces) }
end
