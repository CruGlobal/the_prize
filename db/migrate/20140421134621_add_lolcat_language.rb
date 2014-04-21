class AddLolcatLanguage < ActiveRecord::Migration
  def change
    Language.create(name: "lolcat", country: "lolcat", code: "lolcat", locale: "lolcat", menu: true, active: true)
  end
end
