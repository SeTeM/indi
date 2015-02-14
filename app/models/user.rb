class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, :login, :api_token, uniqueness: true

  has_many :authentications

  def regenerate_api_token!
    self.api_token = self.class.generate_api_token
    save
  end

  def self.generate_api_token
    10.times do
      token = SecureRandom.hex(10)
      return token if !User.where(api_token: token).exists?
    end
  end
end
