class OauthController < ApplicationController
  skip_before_filter :require_login

  private
end
