class User < ActiveRecord::Base
  authenticates_with_sorcery!

  before_save :init_api_token, on: :create

  private

  def init_api_token
    self.api_token ||= SecureRandom.hex(10)
  end
end
