require 'rails_helper'

RSpec.describe AuthController, type: :controller do
  describe "GET callback" do
    subject { get :callback, provider: 'google_oauth2' }

    before { request.env["omniauth.auth"] = auth_hash }

    context "creates user" do
      context "with DI host" do
        let(:auth_hash) { OmniAuth.config.mock_auth[:di] }

        it { is_expected.to redirect_to root_url }
        it { expect { subject }.to change { User.count }.by(1) }
        it { expect { subject }.to change { Provider.count }.by(1) }
        it { subject and expect(logged_in?).to be_truthy }
      end

      context "without DI host" do
        let(:auth_hash) { OmniAuth.config.mock_auth[:not_di] }

        it { subject and expect(logged_in?).to be_falsey }
        it { subject and expect(has_error?).to be_truthy }
      end
    end
  end
end
