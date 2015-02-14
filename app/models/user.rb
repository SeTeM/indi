class User < ActiveRecord::Base
  authenticates_with_sorcery!

  before_validation :init_api_token, :extract_login_from_email, on: :create

  validates :email, :login, :api_token, uniqueness: true

  has_many :authentications

  def regenerate_api_token!
    init_api_token
    save
  end

  private

  def init_api_token
    self.api_token = SecureRandom.hex(10)
  end

  def extract_login_from_email
    self.login = email.split("@")[0]
  end
end
