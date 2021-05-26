class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  # unless Rails.env.development?
  #   rescue_from Exception,                        with: :_render_500
  #   rescue_from ActiveRecord::RecordNotFound,     with: :_render_404
  #   rescue_from ActionController::RoutingError,   with: :_render_404
  # end

  def routing_error
   raise ActionController::RoutingError, params[:path]
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password, :password_confirmation, :admin]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
      categories_path
  end

  # def render_404(e = nil)
  # logger.info "Rendering 404 with exception: #{e.message}" if e
  #
  #   if request.format.to_sym == :json
  #     render json: { error: '404 error' }, status: :not_found
  #   else
  #     render 'errors/error_404', status: :not_found
  #   end
  # end

  def render_404
   render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500(e = nil)
    logger.error "Rendering 500 with exception: #{e.message}" if e
    Airbrake.notify(e) if e # Airbrake/Errbitを使う場合はこちら

    if request.format.to_sym == :json
      render json: { error: '500 error' }, status: :internal_server_error
    else
      render 'errors/error_500', status: :internal_server_error
    end
  end

end
