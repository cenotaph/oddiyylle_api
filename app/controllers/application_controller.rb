class ApplicationController < ActionController::API
  wrap_parameters false
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


  def render_not_found_response(exception)
    render json: { errors: [{ detail: exception.message, title: I18n.t('api.errors.error_404'), status: 404 }] }, status: :not_found
  end

  def respond_with_errors(exception)
    if exception.respond_to?('errors')
      Rails.logger.error exception.errors.inspect
      message = exception.errors.full_messages.join('; ')
    elsif exception.message
      Rails.logger.error exception.message
      message = exception.message
    else
      message = I18n.t('activerecord.errors.unknown')
    end

    render json: { errors: [{ title: message, status: 422 }] }, status: :unprocessable_entity
  end
  
end
