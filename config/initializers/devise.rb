# frozen_string_literal: true

Devise.setup do |config|
  require 'devise/orm/active_record'

  config.navigational_formats = ['*/*', :html, :turbo_stream]
  config.authentication_keys = [:username]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.expire_all_remember_me_on_sign_out = true
  config.sign_out_via = :delete
end
