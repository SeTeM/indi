Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, Settings.google.client_id, Settings.google.secret, {
    name: "google",
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 200,
    access_type: 'online'
  }
end
