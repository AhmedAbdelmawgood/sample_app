module ApplicationHelper
	
	def full_title(page_title = '')
		base_title = "Ruby On Rails Tutorial"
		if page_title.empty?
			return base_title
		end
		"#{page_title} | #{base_title}"
	end
	
end
