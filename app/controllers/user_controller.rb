class UserController < ApplicationController
  def create
    @user = User.create(user_params)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :facebook_id, :email)
  end
  
end
