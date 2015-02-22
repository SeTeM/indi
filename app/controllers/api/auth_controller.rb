class API::AuthController < API::BaseController
  skip_before_filter :require_login

  def show
    render json: { url: "/auth/#{provider}" }
  end

  private

  def provider
    params[:id]
  end
end
