class ProfilesController < ApplicationController
  def index
    users = User.all
    render json: users.map(&:username)
  end

  def show
    user = User.find_by(username: params[:id])
    render json: user.username
  end

  def current
    render json: current_user.to_json
  end
end
