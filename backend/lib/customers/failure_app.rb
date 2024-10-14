class Customers::FailureApp < Devise::FailureApp
  def http_auth
    redirect_to new_customer_session_path
  end
end
