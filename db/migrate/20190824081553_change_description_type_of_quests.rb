class ChangeDescriptionTypeOfQuests < ActiveRecord::Migration[5.2]
  def change
    change_column :quests, :description, :text
  end
end
