require 'rails_helper'

RSpec.describe Extractor::Google do
  let(:auth) { OmniAuth.config.mock_auth[:google] }

  subject { described_class.new(auth) }

  its(:provider)    { is_expected.to eq('google') }
  its(:name)        { is_expected.to eq('Vlad Syabruk') }
  its(:email)       { is_expected.to eq('vlad@dreamindustries.co') }
  its(:uid)         { is_expected.to eq('123545') }
  its(:image)       { is_expected.to eq('https://image-url.com') }
  its(:nickname)    { is_expected.to eq('vlad') }
end
