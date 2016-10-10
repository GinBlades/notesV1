class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  before_action do
    if current_user
      Rails.logger.info "USER: #{current_user.inspect}"
    end
  end
  before_action :authenticate_user!

end
