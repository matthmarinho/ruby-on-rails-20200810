require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module RubyOnRails20200810
	class Application < Rails::Application
	config.load_defaults 6.1
	config.api_only = true
	config.autoload_paths << Rails.root.join('lib')

	config.middleware.insert_before 0, Rack::Cors do
		allow do
		origins '*'
			resource '*',
				headers: :any,
				methods: %i(get post put patch delete options head)
			end
		end
	end
end
