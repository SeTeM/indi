class Provider < ActiveRecord::Base
  belongs_to :user

  serialize :raw, Hash

  def userpic
    raw['info']['image']
  end
end
