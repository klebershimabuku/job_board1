# encoding: utf-8
module AgenciesHelper
	
	def display_if_present(item)
		if item.blank?
			"Não disponível."
		else
			item
		end
	end
end
