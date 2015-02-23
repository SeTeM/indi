class AuthController < ApplicationController
  def callback
    if user
      if belongs_to_team?
        login(user)
      else
        cookies[:error] = "U r not DI member"
      end
    else
      cookies[:error] = "Error while login"
    end
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user
    @user ||= ExternalUserService.new(auth_hash).find_or_create
  end

  def belongs_to_team?
    UserPolicy.new(user).belongs_to_team?
  end
end
