class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :description
      t.string :mode
      t.integer :people_wanted
      t.references :category, foreign_key: true
      t.integer :xp
      t.string :location
      t.date :begin_on
      t.string :duration
      t.string :progress
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
