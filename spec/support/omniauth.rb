OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
  provider: 'google',
  uid: '123545',
  info: {
    name: "Vlad Syabruk",
    email: "vlad@dreamindustries.co",
    image: "https://image-url.com"
  },
  credentials: {
    token: "token",
    expires_at: 1.day.from_now.to_i,
    expires: true
  }
})
OmniAuth.config.add_mock(:google)
