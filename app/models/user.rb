class User < ActiveRecord::Base
  before_validation :init_api_token, :extract_login_from_email, on: :create

  validates :email, :login, :api_token, uniqueness: true

  has_many :providers

  def regenerate_api_token!
    init_api_token
    save
  end

  def belongs_to_team?
    %w(bookmate.com zvooq.ru).any? do |host|
      email.include?("@#{host}")
    end
  end

  private

  def init_api_token
    self.api_token = SecureRandom.hex(10)
  end

  def extract_login_from_email
    self.login = email.split("@")[0]
  end
end
