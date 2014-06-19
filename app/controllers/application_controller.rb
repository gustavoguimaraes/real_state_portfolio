class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!
    redirect_to user_omniauth_authorize_path(:google_oauth2) unless user_signed_in?
  end

  def after_sign_in_path_for(user)
    # this isn't set - maybe we can work somethign up in the session
    # return request.env['omniauth.origin'] if request.env['omniauth.origin']
    return admin_root_path
  end

end
