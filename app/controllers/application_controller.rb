class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_logged_in, :except => ['login','logout']
  
  protected

  def check_logged_in

    if session[:user_id].blank?
      respond_to do |format|
        format.html { redirect_to '/logout' }
      end
    elsif not session[:user_id].blank?
      User.current = User.find(session[:user_id])
    end
  end

end
