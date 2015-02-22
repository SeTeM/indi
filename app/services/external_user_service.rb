class ExternalUserService
  attr_reader :auth_hash, :user, :provider

  def initialize(auth_hash)
    @auth_hash = auth_hash.with_indifferent_access
  end

  def find_or_create
    find || create
    user
  end

  private

  def find
    @provider = Provider.where(uid: auth_hash[:uid]).first
    @user = provider.user if provider
  end

  def create
    create_user
    create_provider
  end

  def create_provider
    @provider = Provider.create!(
      user_id: user.id,
      provider: auth_hash[:provider],
      uid: auth_hash[:uid],
      raw: auth_hash
    )
  end

  def create_user
    @user = User.create!(
      name: auth_hash[:info][:name],
      email: auth_hash[:info][:email]
    )
  end
end
