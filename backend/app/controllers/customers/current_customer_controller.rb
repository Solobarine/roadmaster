class Customers::CurrentCustomerController < ApplicationController
  def index
    render json: {
      customer: current_customer.as_json(except: :jti)
    }, status: :ok
  end
end
