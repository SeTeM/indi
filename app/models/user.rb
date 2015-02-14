class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, :login, :api_token, uniqueness: true

  before_save :generate_api_token, on: :create

  def regenerate_api_token!
    generate_api_token
    save
  end

  private

  def generate_api_token
    self.api_token = SecureRandom.hex(10)
  end
end
