class UsersController < ApplicationController
  def show
    @bands_of_user = Member.where(user_id: current_user)

    raise
  end
end
