require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

#config.middleware.use ActionDispatch::flash

module TrainingApp4
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Railsアプリデフォルトのタイムゾーン(default 'UTC')
    # TimeZoneList: http://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html
    config.time_zone = 'Asia/Tokyo'

    # i18nで使われるデフォルトのロケールファイルの指定(default :en)
    config.i18n.default_locale = :ja

    config.api_only = true
    config.middleware.use ActionDispatch::Flash
  end
end
