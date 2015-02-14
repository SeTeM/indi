class API::SessionsController < API::BaseController
  skip_before_filter :require_login, only: [:create]

  def create
    if user
      render json: { api_token: @user.api_token }
    else
      render json: { error: 'Login failed' }, status: 409
    end
  end

  def destroy
    current_user.regenerate_api_token!
    logout

    head :no_content
  end

  private

  def user
    @user ||= login(params[:email], params[:password], should_remember: true)
  end
end
