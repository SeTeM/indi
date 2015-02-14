require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#init_api_token" do
    let(:user) { build(:user) }

    it "assigns api_token on create" do
      expect(user.api_token).not_to be
      user.save
      expect(user.api_token).to be
    end
  end
end
