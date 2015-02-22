require 'rails_helper'

RSpec.describe API::UsersController, type: :controller do
  describe "GET index" do
    let(:user) { create :user }

    context "when logged in" do
      subject { get :index, token: user.token }

      it { is_expected.to be_success }
      it { expect(json[:users].count).to eq(1) }
    end

    context "when logged out" do
      subject { get :index }

      it { is_expected.to have_http_status(:unauthorized) }
    end
  end
end
