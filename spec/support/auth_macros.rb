module AuthMacros
  def login_user(user)
    request.cookies[:token] = user.token
  end
end

RSpec.configure do |config|
  config.include AuthMacros, type: :controller
end
