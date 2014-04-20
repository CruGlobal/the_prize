class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :country
      t.string :code
      t.string :locale
      t.boolean :menu, default: false
      t.boolean :active, default: false
      t.timestamps
    end

    Language.create(name: "United States", country: "us", code:"en", menu: true, active: true)
    Language.create(name: "香港 (中文)", country: "hk", code:"ch")
  end
end
