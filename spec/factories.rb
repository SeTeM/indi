FactoryGirl.define do
  factory :user do
    name "Vlad"
    login { name.downcase }
    email { "#{login}@example.com" }
  end
end
