class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :user, foreign_key: true
      t.references :quest, foreign_key: true
      t.integer :user_review_id
      t.integer :quest_review_id

      t.timestamps
    end
  end
end
