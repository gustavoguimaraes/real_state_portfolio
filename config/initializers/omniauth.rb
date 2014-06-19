Rails.application.config.middleware.use OmniAuth::Builder do
  # moved all of this lot to devise.rb
  # provider :developer if Rails.env.development?
  # provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], {
  #   prompt: "select_account",
  #   image_aspect_ratio: "square"
  # }
end

OmniAuth.config.logger = Rails.logger