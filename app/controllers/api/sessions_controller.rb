class API::SessionsController < API::BaseController
  skip_before_filter :require_login, only: [:create]

  # def new
  #   @user = User.new
  # end

  def create
    if @user = login(params[:email], params[:password], should_remember: true)
      render json: { api_token: @user.api_token }
    else
      render json: { error: 'Login failed' }, status: 409
    end
  end

  # def destroy
  #   logout
  #   redirect_to(:users, notice: 'Logged out!')
  # end
end
