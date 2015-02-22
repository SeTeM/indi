require 'rails_helper'

RSpec.describe Provider, type: :model do
  subject { build(:provider) }

  describe "#userpic" do
    its(:userpic) { is_expected.to be }
  end
end
