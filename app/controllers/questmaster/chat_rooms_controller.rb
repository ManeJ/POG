class Questmaster::ChatRoomsController < ApplicationController
  def show
    @quest = Quest.find(params[:quest_id])
    @chat_room = ChatRoom.includes(messages: :user).find(@quest.chat_room.id)
  end
end
