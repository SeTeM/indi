class Tag::CreatingService < Tag::PersistingService
  def initialize(attributes = {})
    super Tag.new attributes
  end
end
