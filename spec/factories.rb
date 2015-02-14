FactoryGirl.define do
  factory :user do
    name "Vlad"
    login { name.downcase }
    email { "#{login}@example.com" }
    activation_state :active

    after(:create) do |user, evaluator|
      user.activate!
    end
  end
end
