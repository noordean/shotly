class UsersController < ApplicationController

  def create
    user = User.create!(user_params)
    json_response(user, :created)
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
