module ApplicationHelper
	def is_active?(path, active="active")
		active if current_page? path
	end
end
