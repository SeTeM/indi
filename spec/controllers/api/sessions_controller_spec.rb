require 'rails_helper'

RSpec.describe API::SessionsController, type: :controller do
  describe "POST create" do
    let(:password) { "123456" }
    let(:user) { create :user, password: password }

    subject { post :create, email: user.email, password: password }

    it { is_expected.to be_success }
    it { expect(json[:api_token]).to eq(user.api_token) }
    it { subject and expect(logged_in?).to be_truthy }
  end

  describe "DELETE destroy" do
    let(:user) { create :user }

    subject { delete :destroy, token: user.api_token }

    it { is_expected.to be_success }

    it { expect { subject }.to change { user.reload.api_token } }
  end
end
