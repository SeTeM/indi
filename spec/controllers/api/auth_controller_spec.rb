require 'rails_helper'

RSpec.describe API::AuthController, type: :controller do
  describe "POST create" do
    let(:provider) { "github" }

    subject { get :show, id: provider }

    it { is_expected.to be_success }

    it "returns url" do
      expect(json[:url]).to match /#{provider}/
    end
  end
end
