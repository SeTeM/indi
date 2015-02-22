module AuthMacros
  def login_user(user)
    request.cookies[:api_token] = user.api_token
  end
end

RSpec.configure do |config|
  config.include AuthMacros, type: :controller
end
