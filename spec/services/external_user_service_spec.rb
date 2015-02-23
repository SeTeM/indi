require 'rails_helper'

RSpec.describe ExternalUserService, type: :model do
  let(:auth) { OmniAuth.config.mock_auth[:di] }
  let(:service) { described_class.new(auth) }

  describe "#find_or_create" do
    subject { service.find_or_create }

    context "creates new user and provider" do
      it { expect { subject }.to change { Provider.count }.by(1) }
      it { expect { subject }.to change { User.count }.by(1) }
      it { is_expected.to be_a User }
    end

    context "find existing user" do
      let!(:provider) { create(:provider, raw: auth) }

      it { expect { subject }.to change { Provider.count }.by(0) }
      it { expect { subject }.to change { User.count }.by(0) }
      it { is_expected.to eq provider.user }
    end
  end
end
