require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Junction
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.after_initialize do
      Thread.new do
        while true
          time = Time.now
        #  puts "     MAKE ROUND " + time.to_s
        #  puts "     TOTAL COUNT " + Round.all.count.to_s
          puts "     REMOVE COUNT " + Round.where("start_time < ?", time - 600).count.to_s
          Round.where("start_time < ?", time - 600).destroy_all
        #  r = Round.new
        #  r.start_time = time + 15
        #  r.save
          sleep 15
        end
      end
    end
  end
end
