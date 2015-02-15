class API::OauthController < API::BaseController
  skip_before_filter :require_login

  def show
    # render json: { url: sorcery_login_url(params[:id]) }
  end
end
