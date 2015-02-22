require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user, email: "vlad@dreamindustries.co") }

  describe "#assign_token" do
    it "assigns token on create" do
      expect(subject.token).not_to be
      subject.save
      expect(subject.token).to be
    end
  end

  describe "#belongs_to_team?" do
    specify do
      expect(subject.belongs_to_team?).to be_truthy
    end
  end

  describe "#extract_login_from_email" do
    before { subject.save }

    its(:login) { is_expected.to eq("vlad") }
  end

  describe "#regenerate_token!" do
    before { subject.save }

    specify do
      expect { subject.regenerate_token! }.to change { subject.token }
    end
  end
end
