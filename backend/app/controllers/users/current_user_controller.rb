class Users::CurrentUserController < ApplicationController
  def index
    if current_user
      render json: {
        user: current_user.as_json(except: :jti)
      }, status: :ok
    else
      render json: { error: 'Unauthenticated' }, status: :unauthorized
    end
  end
end
