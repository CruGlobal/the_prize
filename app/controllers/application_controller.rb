class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  protected

  def current_visit
    return @visit if @visit
    @visit = (session[:visit_id] && Visit.where(:id => session[:visit_id]).first) || 
      Visit.create(:user_agent => request.user_agent, :ip => request.remote_ip, :start_at => Time.now, :end_at => Time.now)
    session[:visit_id] = @visit.id
    return @visit
  end
  helper_method :current_visit

  def set_locale
    # use param first if possible
    if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
      I18n.locale = params[:locale]
    elsif session[:locale]
      I18n.locale = session[:locale]
    else
      I18n.locale = (accepted_locales & I18n.available_locales).first || 'en'
    end
    session[:locale] = I18n.locale
  end

  # returns an descending ranked array of language preferences in IS0-639-1
  # if request.env['HTTP_ACCEPT_LANGUAGES'] is ('en-US,en-GB;q=0.9,es-MX;q=0.8,de-DE;q=0.7') 
  # it will return [:en, :en, :es, :de]
  # 
  # This method is based off code from http_accept_language gem
  # 
  # I decided to use this instead of http_accept_language because that gem is 
  # rack only, and I don't know how to use or debug those type of gems. -AR
  def accepted_locales
    http_accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
    return [] if http_accept_language.blank?
    langs = http_accept_language.scan(/([a-zA-Z]{2,4})(?:-[a-zA-Z]{2})?(?:;q=(1|0?\.[0-9]{1,3}))?/).map do |pair|
      lang, q = pair
      [lang.to_sym, (q || '1').to_f]
    end
    langs.sort_by { |lang, q| q }.map { |lang, q| lang }.reverse.uniq
  end
end
