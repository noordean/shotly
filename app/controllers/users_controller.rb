class UsersController < ApplicationController

  def create
    user = User.create!(user_params)
    json_response(user, :created)
  end
  
  def login
    if login_params[:username].nil? or login_params[:password].nil?
      json_response(
                  {
                    message: "Both username and password must be supplied"
                  }, :unprocessable_entity
                  )
    else
      auth_object = Authentication.new(login_params)
      if auth_object.authenticate
        json_response(
          message: "Login successful!", token: auth_object.generate_token
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

  private

  def user_params
    params.permit(:username, :email, :password)
  end

  def login_params
    params.permit(:username, :password)
  end
end
