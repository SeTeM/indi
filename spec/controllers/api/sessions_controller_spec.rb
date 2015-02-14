require 'rails_helper'

RSpec.describe API::SessionsController, type: :controller do
  describe "POST create" do
    let(:password) { "123456" }
    let(:user) { create :user, password: password }

    subject { post :create, email: user.email, password: password }

    it { expect(json[:api_token]).to eq(user.api_token) }
    it { subject and expect(logged_in?).to be_truthy }
  end
end
