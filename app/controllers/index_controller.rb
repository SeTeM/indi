class IndexController < ApplicationController
  before_action :validate_cookies_token

  def index
  end
end
