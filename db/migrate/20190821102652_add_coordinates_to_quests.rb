class AddCoordinatesToQuests < ActiveRecord::Migration[5.2]
  def change
    add_column :quests, :latitude, :float
    add_column :quests, :longitude, :float
  end
end
