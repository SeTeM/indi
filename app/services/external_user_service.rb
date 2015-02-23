class ExternalUserService
  attr_reader :extractor, :user, :provider

  def initialize(auth)
    @extractor = Extractor::Base.load(auth)
  end

  def find_or_create
    find || create
    user
  end

  private

  def find
    @provider = Provider.where(uid: extractor.uid).first
    @user = provider.user if provider
  end

  def create
    create_user
    create_provider
  end

  def create_provider
    @provider = Provider.create!(
      user_id: user.id,
      title: extractor.provider,
      uid: extractor.uid,
      raw: extractor.auth
    )
  end

  def create_user
    @user = User.create!(
      name: extractor.name,
      email: extractor.email
    )
  end
end
