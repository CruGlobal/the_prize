class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :ip
      t.string :missionhub_id
      t.text :user_agent
      t.datetime :start_at
      t.datetime :end_at
      t.string :vid1_response
      t.string :vid2_response
      t.boolean :kit_signup
      t.string :email
      t.string :name
      t.boolean :go_alone
      t.string :friend_email

      t.timestamps
    end
  end
end
