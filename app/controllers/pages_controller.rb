class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :faq, :rewards]

  def home
  end

  def profile
  end

  def rewards
  end

  def faq
  end

end
