class User < ActiveRecord::Base
  before_validation :assign_token, on: :create

  validates :email, :login, :token, uniqueness: true

  has_many :providers, dependent: :destroy

  def regenerate_token!
    assign_token
    save
  end

  def userpic
    providers.each do |p|
      return p.userpic if p.userpic
    end
    nil
  end

  private

  def assign_token
    self.token = SecureRandom.hex(10)
  end
end
