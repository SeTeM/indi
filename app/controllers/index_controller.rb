class IndexController < ApplicationController
  before_filter :require_login

  def index
  end

  def not_authenticated
    render :sign_in
  end
end
