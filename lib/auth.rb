module Auth
  def self.included(klass)
    klass.class_eval do
      include InstanceMethods
    end
  end

  module InstanceMethods
    def login(user)
      if user
        @current_user = user
        cookies.permanent[:token] = user.token
      end
    end

    def logout
      if logged_in?
        regenerate_token(current_user)
        @current_user = nil
      end
    end

    def require_login
      if !logged_in?
        session[:return_to_url] = request.url if request.get?
        self.send(:not_authenticated)
      end
    end

    def logged_in?
      !!current_user
    end

    def current_user=(user)
      @current_user = user
    end

    def current_user
      unless defined?(@current_user)
        @current_user = login_from_api_token
      end
      @current_user
    end

    def validate_cookies_token
      if cookies[:token]
        cookies.delete(:token) unless User.where(token: cookies[:token]).exists?
      end
    end

    protected

    def login_from_api_token
      User.where(token: token).first
    end

    def token
      params[:token] || cookies[:token]
    end

    def regenerate_token(user)
      user.regenerate_token!
    end
  end
end
