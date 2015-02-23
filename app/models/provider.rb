class Provider < ActiveRecord::Base
  belongs_to :user

  serialize :raw, Hash

  def userpic
    Extractor::Base.load(raw.to_h).image
  end
end
