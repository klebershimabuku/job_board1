class Province < ActiveRecord::Base
	has_and_belongs_to_many :companies
	has_many :agencys
	has_many :prefectures
end
