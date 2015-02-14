require 'rails_helper'

RSpec.describe IndexController, type: :controller do
  describe "GET index" do
    subject { get :index }
    let(:user) { create :user }

    context "when logged out" do
      before { logout_user }

      it { is_expected.to render_template("index/sign_in")}
    end

    context "when logged in" do
      before { login_user user }

      it { is_expected.to render_template(:index) }
    end
  end
end
