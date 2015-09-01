class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
     redirect_to root_url, :alert => "Sorry"
  end
  # helper_method :authorize

  layout :layout_by_resource
   def layout_by_resource
    if devise_controller? && resource_name == :user 
      "admin"
    else
      "application"
    end
  end
  
  
  private
  
  # def authorize
  #   if current_user.customer?
  #     redirect_to root_url
  #   end
  # end
  
  
end
