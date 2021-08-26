class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :bands

  def bands
    @user_bands = Band.joins(:members).where(members: { user_id: current_user })
  end
end
