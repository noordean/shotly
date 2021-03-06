class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    json_response(
      {
        id: user.id,
        username: user.username,
        email: user.email,
        token: Authentication.new(user_params).generate_token
      },
      :created
    )
  end

  def login
    if login_params[:username].nil? || login_params[:password].nil?
      json_response(
        {
          message: "Both username and password must be supplied"
        }, :unprocessable_entity
      )
    else
      auth_object = Authentication.new(login_params)
      if auth_object.authenticate
        json_response(
          message: "Login successful!",
          username: login_params[:username],
          token: auth_object.generate_token
        )
      else
        json_response(
          {
            message: "Incorrect username/password combination"
          }, :unauthorized
        )
      end
    end
  end

  # GET /users/total
  def get_total_user
    json_response(
      message: User.all.size
    )
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end

  def login_params
    params.permit(:username, :password)
  end
end
