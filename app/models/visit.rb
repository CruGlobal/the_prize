require 'rest'

class Visit < ActiveRecord::Base
  MH_VISITOR_PERMISSION = 2
  MH_LEADER_PERMISSION  = 4

  def first_name
    words = name.split(' ')
    words.pop
    words.join(' ')
  end

  def last_name
    name.split(' ').last
  end

  def sync_mh
    return unless email.present?
    byebug
    p = Rest.post("https://www.missionhub.com/apis/v3/people?secret=#{ENV['MISSIONHUB_SECRET']}&permissions=#{Visit::MH_VISITOR_PERMISSION}#{"&person[first_name]=#{esc(first_name)}" if first_name.present?}#{"&person[last_name]=#{esc(last_name)}" if last_name.present?}#{"&person[email]=#{email}" if email.present?}")["person"]
    self.update_attribute :missionhub_id, p["id"]
  end

  def esc(s)
    ERB::Util.url_encode(s)
  end
end
