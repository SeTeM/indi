class Provider::CreatingService < Provider::PersistingService
  def initialize(attributes = {})
    super Provider.new attributes
  end
end
