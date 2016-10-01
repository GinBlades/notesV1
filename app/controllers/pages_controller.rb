class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  def home
    if user_signed_in?
      render "guest"
    else
      render "member"
    end
  end
end
