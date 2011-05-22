# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_leo_session',
  :secret      => '276431d8788226049d19e472645ba7caafa0a1acc8f4486f072558e1e20fc81d04ceb048814853a2e28d28f0dddaf8b380531da6693bef1b2b8eab9c258aa1f3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
