# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|

  config.mailer_sender = 'noreply@patientportal.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11
  
  config.allow_unconfirmed_access_for = 365.days

  config.reconfirmable = false

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete
  
  config.omniauth :facebook,'1271944296227780','bd1614bf1b8f7467ac3a2d2d31a9e49a',scope: 'email',info_fields: 'email'
  
  config.omniauth :google_oauth2, '135700481541-dgk778ntre7n52v3q1rlvr5im8is8ba2.apps.googleusercontent.com', '47eKpL6BrQos0XDe-Gz0m_kV'
  
  
end
