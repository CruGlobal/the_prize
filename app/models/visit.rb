class Visit < ActiveRecord::Base
  def first_name
    words = name.split(' ')
    words.pop
    words.join(' ')
  end

  def last_name
    name.split(' ').last
  end

  def sync_mh(params = {})
    return unless email.present?
    p = Rest.post("https://www.missionhub.com/apis/v3/people?secret=#{ENV['missionhub_token']}&permissions=#{User::VISITOR_PERMISSION}#{"&person[first_name]=#{esc(first_name)}" if first_name.present?}#{"&person[last_name]=#{esc(last_name)}" if last_name.present?}#{"&person[email]=#{email}" if email.present?}")["person"]
    self.update_attribute :missionhub_id, p["id"]
  end
end
