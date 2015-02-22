require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#assign_token" do
    let(:user) { build(:user) }

    it "assigns token on create" do
      expect(user.token).not_to be
      user.save
      expect(user.token).to be
    end
  end
end
