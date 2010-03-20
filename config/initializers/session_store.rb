# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_barcode_reader_session',
  :secret      => 'a04bd3cd9435635adf5c70df974ec9335fe0dad64833d8e77ec0cde60eedca30c0b2f7d55da2a44721ec918dc154927fc6beda97ced55b00d877c0e661b03698'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
