module ApplicationHelper
  def is_active?(path, active="active")
    if path == root_path
      active if current_page? path
    else
      active if request.path.include? path
    end
  end

  def current_language
    logger.info("current_language I18n.locale.to_s: #{I18n.locale.to_s}")
    l = I18n.locale.to_s
    Language.find_by(locale: l == "en" ? "en-US" : l)
  end

  def locale_menu
    Language.where("menu = true and id != ?", current_language.id)
  end
end
