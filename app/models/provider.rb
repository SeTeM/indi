class Provider < ActiveRecord::Base
  belongs_to :user

  serialize :raw, Hash
end
