class AuthController < ApplicationController
  def callback
    if user
      if user.belongs_to_team?
        login(user)
      else
        cookie[:flash][:error] = "U r not DI member"
      end
    else
      cookie[:flash][:error] = "Error while login"
    end
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user
    @user ||= ExternalUserService.find_or_create(auth_hash)
  end
end
