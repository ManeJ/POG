class RemoveColumnQuestsXp < ActiveRecord::Migration[5.2]
  def change
    remove_column :quests, :xp
  end
end
