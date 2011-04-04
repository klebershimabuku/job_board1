class Province < ActiveRecord::Base
	has_and_belongs_to_many :companies
	has_and_belongs_to_many :resumes
	has_many :agencys
	has_many :prefectures
	paginates_per 100
	
	def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
	end	
end
