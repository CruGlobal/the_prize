module ApplicationHelper
	def is_active?(path, active="active")
		if path == root_path
			active if current_page? path
		else
			active if request.path.include? path
		end
	end

	def current_locale
		Language.find_by(locale: I18n.locale.to_s)
	end

	def locale_menu
		Language.where("menu = true and id != ?", current_locale.id)
	end
end
