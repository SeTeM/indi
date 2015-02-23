require 'rails_helper'

RSpec.describe UserPolicy, type: :model do
  subject { described_class.new(user) }

  describe "#belongs_to_team?" do
    context "with DI host" do
      let(:user) { build(:user, email: "vlad@dreamindustries.co") }

      specify do
        expect(subject.belongs_to_team?).to be_truthy
      end
    end

    context "with not DI host" do
      let(:user) { build(:user, email: "vlad@yandex.ru") }

      specify do
        expect(subject.belongs_to_team?).to be_falsey
      end
    end
  end
end
