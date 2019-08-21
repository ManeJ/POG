class AddTitleToQuests < ActiveRecord::Migration[5.2]
  def change
    add_column :quests, :title, :string
  end
end
