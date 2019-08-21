class ChangePeopleWantedColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :quests, :people_wanted, :integer, default: 1
  end
end
