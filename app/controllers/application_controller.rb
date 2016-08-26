class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def check_hr
    if current_user.profile.desgination != "HR"
      flash[:danger] = "You are not authorized!"
      redirect_to root_path
    end
  end
  
  def check_manager
    if current_user.profile.desgination != "Manager"
      flash[:danger] = "You are not authorized!"
      redirect_to root_path
    end
  end
  
  
end
