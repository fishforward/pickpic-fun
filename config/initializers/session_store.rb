# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fRails_session',
  :secret      => '41399eb89c5d48a2189f8a00088706b91f4750032efe9624e36923272299166c398c7b8b32c1b8c10bf1ea5f71ad874a2ccf98d0eb7d543570ab49728c921bc0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
