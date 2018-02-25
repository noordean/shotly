class Authorization
  def authorize_user
    request.headers[:HTTP_TOKEN].present?
  end
end
