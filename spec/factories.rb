FactoryGirl.define do
  factory :user do
    name "Vlad"
    login { name.downcase }
    email { "#{login}@example.com" }
  end

  factory :provider do
    title "github"
    user
    sequence(:uid) {|n| "uid-#{n}" }
    raw { OmniAuth.config.mock_auth[:di] }
  end
end
