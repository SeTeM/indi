class API::BaseController < ApplicationController
  before_filter :require_login

  private

  def not_authenticated
    render json: { error: "Unauthorized" }, status: :unauthorized
  end
end
