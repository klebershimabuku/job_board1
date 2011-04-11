module ResumesHelper
	
	def province(id)
		Province.find(id).name
	end
	
	def iconify_gender(gender)
		if gender == 'feminino'
			image_tag('icon_female.gif', :alt => 'Feminino', :title => 'Feminino')
		else
			image_tag('icon_male.gif', :alt => 'Masculino', :title => 'Masculino')
		end
	end
	
end
