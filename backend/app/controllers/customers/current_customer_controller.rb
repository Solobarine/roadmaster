class Customers::CurrentCustomerController < ApplicationController
  def index
    if current_customer
      render json: {
        customer: current_customer.as_json(except: :jti)
      }, status: :ok
    else
      render json: { error: 'Unauthenticated' }, status: :unauthorized
    end
  end
end
