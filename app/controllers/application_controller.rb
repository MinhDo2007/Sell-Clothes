class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :get_locate_company

  protected
  def get_locate_company
    @companies = Company.last
    @hash = Gmaps4rails.build_markers(@companies) do |company, marker|
      marker.lat company.latitude
      marker.lng company.longitude
      marker.infowindow company.title
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, :phone])
  end
end
