class BandsController < ApplicationController
  def index
    @bands = Band.all
    @user_bands = Member.where(user_id: current_user)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
