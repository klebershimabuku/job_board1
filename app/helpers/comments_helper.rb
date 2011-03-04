# encoding: utf-8
module CommentsHelper
	
	def author_for(author)
		if author.blank?
			"Anönimo"
		else
			author
		end
	end
	
end