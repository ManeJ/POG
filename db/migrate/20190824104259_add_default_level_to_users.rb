class AddDefaultLevelToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :level, from: nil, to: 1)
  end
end

# From... To... = pour que ce soit réversible, sinon on ne peut pas rollback
