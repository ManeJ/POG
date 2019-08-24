class RemoveDefaultXpOffCategories < ActiveRecord::Migration[5.2]
  def change
    change_column_default :categories, :xp, nil
  end
end
