class AddVariablesToChatRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :chat_rooms, :quest, foreign_key: true
  end
end
