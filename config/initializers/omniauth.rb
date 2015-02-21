Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, "469201966549-l3gpdoivov7tjp66v2uqd2chonql8gj8.apps.googleusercontent.com", "vR6IAnYRYGgTDtrEDoB1v9qS"
end
