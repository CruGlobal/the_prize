class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_visit
    return @visit if @visit
    @visit = (session[:visit_id] && Visit.where(:id => session[:visit_id]).first) || 
      Visit.create(:user_agent => request.user_agent, :ip => request.remote_ip, :start_at => Time.now, :end_at => Time.now)
    session[:visit_id] = @visit.id
    return @visit
  end
  helper_method :current_visit
end
