Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "185705521856637", "8e892e5059501e678abfd813a6766866",
           :scope => 'email,user_birthday,read_stream', :display => 'popup'
end
