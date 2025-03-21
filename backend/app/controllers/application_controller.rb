class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :entity_not_authorized

  def pundit_user
    current_user || current_customer
  end

  protected

  def update_allowed_parameters
    if resource_class == Customer
      allow_customer_parameters
    elsif resource_class == User
      allow_user_parameters
    end
  end

  def allow_customer_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_surname, :email, :password, :current_password, :phone, :address, :city, :state,
               :zip_code)
    end
  end

  def allow_user_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :phone, :position, :hire_date)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :phone, :position, :hire_date)
    end
  end

  def entity_not_authorized
    render json: { error: 'Unauthorized' }, status: :forbidden
  end
end
