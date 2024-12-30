class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  def set_locale
    cookies[:locale] = params[:locale] if params[:locale]

    if cookies[:locale] && I18n.locale != cookies[:locale]
      I18n.locale = cookies[:locale]
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nickname ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :nickname ])
  end

  private

  def verify_permission
    if current_user != resource_user
      redirect_to root_path, alert: t("text.permission_denied")
    end
  end

  def resource_user
    raise NotImplementedError, t("text.define_resource_alert")
  end
end
