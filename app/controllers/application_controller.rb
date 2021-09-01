class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :bands

  def bands
    @user_bands = Band.joins(:members).where(members: { user_id: current_user })
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :photo])
  end
  # salut
end
