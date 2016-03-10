class CreateUserParticipatingEvents < ActiveRecord::Migration
  def change
    create_table :user_participating_events do |t|
      t.integer :participator_id
      t.integer :participating_event_id

      t.timestamps null: false
    end
  end
end
