class ChangeLevelOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :level, 'integer USING CAST(level AS integer)'
  end
end
