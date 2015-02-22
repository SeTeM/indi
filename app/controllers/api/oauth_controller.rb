class API::OauthController < API::BaseController
  skip_before_filter :require_login

  def show
    render json: { url: callback_auth_url(provider) }
  end

  private

  def provider
    params[:id]
  end
end
