# frozen_string_literal: true

class Customers::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if request.method == 'DELETE'
      # current_customer is destroyed successfully
      render status: :ok
    elsif request.method == 'POST' && resource.persisted?
      # current_customer is created successfully
      render json: {
        customer: current_customer.as_json(except: :jti)
      }, status: :ok
    else
      # current_customer is not created successfully
      render json: {
        messages: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
end
