require 'rails_helper'

RSpec.describe AuthController, type: :controller do
  describe "GET callback" do
    let(:user) { create(:user) }
    let(:external_service) { double("ExternalUserService", find_or_create: user) }

    subject { get :callback, provider: 'google_oauth2' }

    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:di]
      allow(UserPolicy).to receive(:new).and_return(policy)
      allow(ExternalUserService).to receive(:new).and_return(external_service)
    end

    context "creates user" do
      context "when belongs to team" do
        let(:policy) { double("policy", "belongs_to_team?" => true) }

        it { is_expected.to redirect_to root_url }
        it { subject and expect(logged_in?).to be_truthy }
      end

      context "when not belongs to team" do
        let(:policy) { double("policy", "belongs_to_team?" => false) }

        it { subject and expect(logged_in?).to be_falsey }
        it { subject and expect(has_error?).to be_truthy }
      end
    end
  end
end
