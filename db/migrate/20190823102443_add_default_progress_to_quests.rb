class AddDefaultProgressToQuests < ActiveRecord::Migration[5.2]
  def change
    change_column :quests, :progress, :string, default: "Pending"
  end
end
