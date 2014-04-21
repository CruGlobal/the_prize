require 'net/http'

def translate_to_lolcat(s)
  if s =~ /<%/
    puts "Skipping ERB: #{s}"
    return s
  elsif s =~ /player.vimeo.com/
    puts "Keeping video_url"
    return s
  else
    #ps = s.gsub(' ','+')
    ps2 = URI::encode(s)
    #puts "http://speaklolcat.com/?from=#{ps2}"
    result_html = Net::HTTP.get 'speaklolcat.com', "/?from=#{ps2}"
    result_html =~ /<textarea id="to" rows="3" cols="30">(.*?)<\/textarea>/m
    lolcat = $1
    #puts result_html
    puts "TRANSLATE: #{s}"
    puts "   lolcat: #{lolcat}"
    subs = s.scan(/\%\{(.*?)\}/).collect{ |s| s.first.downcase }
    i = 0
    r = lolcat.gsub(/\%\{(.*?)\}/) { |match| s = "%{#{subs[i]}}"; i += 1; s }
    puts "   return: #{r}"
    return r
  end
end

def translate_hash_to_lolcat(h)
  return_h = {}
  h.keys.each do |k|
    v = h[k]
    if v =~ /\.png|\.gif/
      new_v = v
    elsif v.is_a?(Hash)
      new_v = translate_hash_to_lolcat(v)
    else
      puts "key #{k}"
      new_v = translate_to_lolcat(v)
    end

    new_k = (k == "en" ? "lolcat" : k)
    return_h[new_k] = new_v
  end
  return return_h
end

namespace :translate do
  desc "translate en-CA to lolcats"
  task :lolcat do
    en = YAML::load(File.read('config/locales/en.yml'))
    out_file = File.open(Rails.root.join("config/locales/lolcat.yml"), "w")
    merged_result = translate_hash_to_lolcat(en)["lolcat"]
    merged_hash = { "lolcat" => merged_result }
    out_file.print(merged_hash.to_yaml)
  end
end
