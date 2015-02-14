require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#regenerate_api_token!" do
    let(:user) { create(:user) }

    it "assigns api_token on create" do
      expect(user.api_token).not_to be
      user.save
      user.regenerate_api_token!
      expect(user.api_token).to be
    end
  end
end
