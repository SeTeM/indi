class UserForm < ActionForm::Base
  attributes :email, :login, :password, :api_token, required: true

  def save
    init_api_token
    extract_login_from_email
    super
  end

  private

  def init_api_token
    self.api_token ||= User.generate_api_token
  end

  def extract_login_from_email
    self.login ||= email.split("@")[0]
  end
end
