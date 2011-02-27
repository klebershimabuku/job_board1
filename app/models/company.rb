class Company < ActiveRecord::Base
	has_and_belongs_to_many :provinces
	
	def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
	end

  def increase_pagehit
  	class << self
  		def record_timestamps; false; end
  	end

   	self.increment! :visits

  	class << self
  		remove_method :record_timestamps
  	end
  end
end
