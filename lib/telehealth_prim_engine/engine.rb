module TelehealthPrimEngine
  # Main application
  class Engine < ::Rails::Engine
    isolate_namespace TelehealthPrimEngine

    config.generators do |g|
      g.test_framework :rspec
      g.helper false
    end
  end
end
