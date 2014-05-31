class AddMoreLanguages < ActiveRecord::Migration
  def change
    languages = [ 
      [ "Arabic", "ar" ],
      [ "Armenian", "hy" ],
      [ "Azerbaijani", "az" ],
      [ "Cambodian", "km" ],
      #[ "English", "en" ],
      [ "French", "fr" ],
      [ "Georgian", "ka" ],
      [ "German", "de" ],
      [ "Hindi", "hi" ],
      [ "Indonedian", "id" ],
      [ "Japanese", "ja" ],
      [ "Kannada", "kn" ],
      [ "Kazakh", "kk" ],
      [ "Korean", "ko" ],
      [ "Kyrgyz", "ky" ],
      [ "Lao", "lo" ],
      [ "Latvian", "lv" ],
      [ "Malay", "ms" ],
      [ "Portugal - Brazil", "pt" ],
      [ "Romanian", "ro" ],
      [ "Russian", "ru" ],
      [ "Spanish - Castilian", "es" ],
      [ "Swahili", "sw" ],
      [ "Tajik", "tg" ],
      [ "Tamil", "ta" ],
      [ "Telugu", "te" ],
      [ "Thai", "th" ],
      [ "Turkish", "tr" ],
      [ "Ukraine", "uk" ]
    ]

    languages.each do |name, code|
      Language.where(:name => name, :code => code, :locale => code, :menu => true).first_or_create
    end
  end
end
