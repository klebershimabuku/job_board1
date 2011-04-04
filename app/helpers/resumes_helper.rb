module ResumesHelper
	
	def province(id)
		Province.find(id).name
	end
	
end
