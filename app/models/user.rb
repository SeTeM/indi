class User < ActiveRecord::Base
  DI_HOSTS = %w(dreamindustries.co bookmate.com zvooq.ru).freeze

  before_validation :assign_token, :extract_login_from_email, on: :create

  validates :email, :login, :token, uniqueness: true

  has_many :providers

  def regenerate_token!
    assign_token
    save
  end

  def belongs_to_team?
    DI_HOSTS.any? do |host|
      email.include?("@#{host}")
    end
  end

  private

  def assign_token
    self.token = SecureRandom.hex(10)
  end

  def extract_login_from_email
    self.login = email.split("@")[0]
  end
end
