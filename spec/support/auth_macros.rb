module AuthMacros
  def login_user(user)
    request.cookies[:token] = user.token
  end

  def logged_in?
    response.cookies['token'].present?
  end

  def has_error?
    response.cookies['error'].present?
  end
end

RSpec.configure do |config|
  config.include AuthMacros, type: :controller
end
