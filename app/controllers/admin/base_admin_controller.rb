class Admin::BaseAdminController < ActionController::Base
  layout "application"
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  # before_action :verify_admin

  # private
  # def verify_admin
  #   redirect_to root_path unless current_user.admin?
  # end
end
