class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?
  include Pundit::Authorization

  protected

  def update_allowed_parameters
    if resource_class === Customer
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:first_name, :last_name, :email, :password)
      end
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(:first_name, :last_surname, :email, :password, :current_password, :phone, :address, :city, :state,
                 :zip_code)
      end
    elsif resource_class === User
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:first_name, :last_name, :email, :password, :phone, :position, :hire_date)
      end
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(:first_name, :last_name, :email, :password, :phone, :position, :hire_date)
      end
    end
  end
end
