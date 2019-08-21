class ChangeColumnLocationToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :quests, :location, :address
  end
end
