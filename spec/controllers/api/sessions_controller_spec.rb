require 'rails_helper'

RSpec.describe API::SessionsController, type: :controller do
  describe "DELETE destroy" do
    let(:user) { create :user }

    subject { delete :destroy, token: user.token }

    it { is_expected.to be_success }

    it { expect { subject }.to change { user.reload.token } }
  end
end
