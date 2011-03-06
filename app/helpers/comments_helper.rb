# encoding: utf-8
module CommentsHelper
	
	def author_for(author)
		if author.blank?
			"Anönimo"
		else
			author
		end
	end
	
	def company_name_for(id)
		Company.find(id).name
	end
	
end