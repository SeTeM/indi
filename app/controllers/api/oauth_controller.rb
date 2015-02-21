class API::OauthController < API::BaseController
  skip_before_filter :require_login

  def callback
    _login || _create
  end

  def show
    # render json: { url: sorcery_login_url(params[:id]) }
  end

  def provider
    params[:id]
  end

  def _login
    @user = login_from(provider)

    if @user
      redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
      true
    else
      false
    end
  end

  def _create
    begin
      @user = create_from(provider)
      @user.activate!
      reset_session # protect from session fixation attack
      auto_login(@user)
      redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
    rescue
      redirect_to root_path, alert: "Failed to login from #{provider.titleize}!"
    end
  end
end
