# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_crop_it_session',
  :secret      => 'd6d8b4d0c2c5617a8a18597f843972e71ce1dedd9448aaf309cf1536db1a19fbf46afacff5a25fbdd933efd06df7637d6ccda48d9578c17d5ac2a668718fd241'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
