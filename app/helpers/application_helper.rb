module ApplicationHelper
	def is_active?(path, active="active")
		if path == root_path
			active if current_page? path
		else
			active if request.path.include? path
		end
	end
end
