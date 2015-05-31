class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.admin?
      render text: "Not authorised", status: :forbidden
    end
  end

  protected

  def current_account
    current_user.account
  end
end
