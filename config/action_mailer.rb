ActionMailer::Base.default_url_options = { host: Rails.application.secrets.email["host"] }
