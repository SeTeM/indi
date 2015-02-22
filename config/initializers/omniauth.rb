Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, "469201966549-dlckdk40u3nahu221ds8160dhu70ssug.apps.googleusercontent.com", "sB2mprDpW-qTl0VPzttWYOZf", {
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 200,
    access_type: 'online'
  }
end
