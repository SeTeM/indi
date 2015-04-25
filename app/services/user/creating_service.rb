class User::CreatingService < User::PersistingService
  def initialize(attributes = {})
    super User.new attributes
  end
end
