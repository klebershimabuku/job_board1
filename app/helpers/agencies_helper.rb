module AgenciesHelper
	
	def display_if_present(item)
		if item.blank?
			"N/D"
		else
			item
		end
	end
end
