class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def myprofil
    @quests = current_user.quests
    @participations = current_user.participations
    @participations.each do |participation|
      if participation.quest == 'Finished'
        current_user.xp = current_user.xp + participation.quest.category.xp
      else
        current_user.xp
      end
    end
  end
end
