class ExternalUserService
  def initialize(auth)
    @extractor = Extractor::Base.load(auth)
  end

  def find_or_create
    find || create
    user
  end

  private

  attr_reader :extractor, :user, :provider

  def find
    @provider = Provider.where(
      title: extractor.provider,
      uid: extractor.uid
    ).first
    @user = provider.user if provider
  end

  def create
    create_user
    create_provider
  end

  def create_provider
    @provider = Provider::CreatingService.new(
      user_id: user.id,
      title: extractor.provider,
      uid: extractor.uid,
      raw: extractor.auth
    ).save
  end

  def create_user
    @user = User::CreatingService.new(
      name: extractor.name,
      email: extractor.email,
      login: extractor.nickname
    ).save
  end
end
