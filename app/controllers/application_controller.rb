class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def current_user
    authorization_object = Authorization.new(request)

    authorization_object.current_user
  end
end
