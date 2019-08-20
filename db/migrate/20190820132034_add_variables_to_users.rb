class AddVariablesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :role, :string
    add_column :users, :telephone, :string
    add_column :users, :photo, :string
    add_column :users, :entity_photo, :string
    add_column :users, :xp, :integer
    add_column :users, :level, :string
  end
end
