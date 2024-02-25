require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CoyellRails
  class Application < Rails::Application

    # デフォルトのタイムゾーンを日本に設定する
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # デフォルトの言語を日本語にする
    config.i18n.default_locale = :ja

    # i18nの複数ロケールファイルが読み込まれるように追記
    config.i18n.load_path += Dir[Rails.root.join('config','locales','**','*{rb,yml}').to_s]

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
