module HeadersHelper
  def set_header(user_id)
    {
      token: JsonWebToken.encode(user_id: user_id)
    }
  end
end
