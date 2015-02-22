OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
  provider: 'google_oauth2',
  uid: '123545',
  info: {
    name: "Vlad Syabruk",
    email: "vlad@dreamindustries.co",
    image: "https://lh6.googleusercontent.com/-n_Y3xsSgPY0/AAAAAAAAAAI/AAAAAAAAABU/8jhtHzGeM5c/s200-c/photo.jpg?sz=200"
  },
  credentials: {
    token: "token",
    expires_at: 1.day.from_now.to_i,
    expires: true
  }
})
OmniAuth.config.add_mock(:di, { info: { email: 'vlad@bookmate.com' } } )
OmniAuth.config.add_mock(:not_di, { info: { email: 'vlad@yandex.ru' } } )
