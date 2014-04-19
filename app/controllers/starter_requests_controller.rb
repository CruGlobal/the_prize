class StarterRequestsController < ApplicationController
  def create
    # TODO send some sort of signal to request a starter kit and their locale (assume they want it in their locale's language)
    if params[:email].present?
      current_visit.update_attribute(:email, params[:email])
    end
    if params[:name].present?
      current_visit.update_attribute(:name, params[:name])
    end
    current_visit.sync_mh
  end
end
