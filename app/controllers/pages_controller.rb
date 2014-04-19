class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_filter :update_visit

  private

  def update_visit
    current_visit.update_attribute(:end_at, Time.now)

    logger.info "PagesController#update_visitor params: #{params}"
    logger.info "PagesController#update_visitor session: #{session.keys.inspect}"
    logger.info "PagesController#update_visitor visit: #{current_visit.id}"
    referrer_path = request.referrer ? URI(request.referrer).path : nil
    logger.info "PagesController#update_visitor referrer: #{referrer_path}"

    case params[:id]
    when "flow/thanks"
      case referrer_path
      when "/"
        current_visit.update_attribute(:vid1_response, "no")
      when "/pages/flow/more"
        current_visit.update_attribute(:vid2_response, "no")
      when "/pages/flow/start"
        current_visit.update_attribute(:vid2_response, "no")
      end
    when "flow/start"
      current_visit.update_attribute(:vid1_response, "start")
    when "flow/christian"
      case referrer_path
      when "/"
        current_visit.update_attribute(:vid1_response, "christian")
      when "/pages/flow/more"
        current_visit.update_attribute(:vid2_response, "christian")
      when "/pages/flow/start"
        current_visit.update_attribute(:vid2_response, "christian")
      end
    when "flow/more"
      current_visit.update_attribute(:vid1_response, "more")
    when "flow/challenge"
      current_visit.update_attribute(:vid2_response, "yes")
    end
  end
end
