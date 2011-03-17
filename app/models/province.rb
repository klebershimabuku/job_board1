class Province < ActiveRecord::Base
	has_and_belongs_to_many :companies
	has_many :agencys
	has_many :prefectures
	
	def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
	end	
end
