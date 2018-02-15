module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |error|
      json_response({ message: error.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      first_error_message = error.message.split(", ")[0]
      display_message = first_error_message.slice(
        first_error_message.index(":") + 2,
        first_error_message.size
      )
      if display_message.include?("has already been taken")
        json_response({ message: display_message }, :conflict)
      else
        json_response({ message: display_message }, :unprocessable_entity)
      end
    end
  end
end
