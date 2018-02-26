class Authentication
  def initialize(user_object)
    @username = user_object[:username]
    @password = user_object[:password]
    @user = User.find_by(username: @username)
  end

  def authenticate
    true if @user && @user.authenticate(@password)
  end

  def generate_token
    JsonWebToken.encode(user_id: @user.id)
  end
end
