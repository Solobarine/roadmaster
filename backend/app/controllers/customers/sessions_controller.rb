# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  respond_to :json

  def destroy
    @authenticated = true
    super
  end

  private

  def verify_signed_out_customer
    current_customer
    super
  end

  def respond_to_on_destroy
    if @authenticated && current_customer.nil?
      # current_customer is logged out successfully
      render status: :ok
    else
      # current_customer is not logged out successfully
      render status: :unprocessable_entity
    end
  end

  def respond_with(_resource, _opts = {})
    if resource
      # current_customer is logged in successfully
      render json: {
        customer: current_customer.as_json(except: :jti)
      }, status: :ok
    else
      # current_customer is not logged in successfully
      render json: {
        messages: ['Invalid Email or Password.']
      }, status: :unprocessable_entity
    end
  end
end
