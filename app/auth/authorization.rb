class Authorization
  def initialize(request)
    @token = request.headers[:HTTP_TOKEN]
  end

  def current_user
    JsonWebToken.decode(@token)[:user_id] if @token
  end
end
