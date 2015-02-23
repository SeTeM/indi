class Provider < ActiveRecord::Base
  belongs_to :user

  serialize :raw, Hash

  def userpic
    extractor.image
  end

  private

  def extractor
    @extractor ||= Extractor::Base.load(raw.to_h)
  end
end
