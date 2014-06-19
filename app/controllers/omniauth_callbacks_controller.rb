class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :check_domain

  def google_oauth2
    @user = User.find_or_create_google(auth_info)
    return redirect_to :root, error: @user.errors.full_messages.to_sentence unless @user.valid?
    return sign_in_and_redirect @user, :event => :authentication
  end

  private

  def check_domain
    users_domain = auth_info[:extra][:raw_info][:hd]
    unless authorized_domains.include?(users_domain)
      flash[:notice] = "You're Google Account is not allowed to log into this application."
      return redirect_to :root
    end
  rescue NoMethodError
    flash[:notice] = "Something went wrong while logging you in."
    return redirect_to :root
  end

  def authorized_domains
    ENV['AUTHORIZED_DOMAINS'].split(',')
  end

  def auth_info
    request.env["omniauth.auth"]
  end

end