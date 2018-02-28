class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!
  skip_before_filter :require_no_authentication, only: [:new]

  def sign_up(resource_name, resource)
    render layout: false
  end
end