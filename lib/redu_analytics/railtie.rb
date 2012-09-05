module ReduAnalytics
  class Railtie < Rails::Railtie
    initializer :add_routing_paths do |app|
      app.routes_reloader.paths.unshift(File.dirname(__FILE__) + "/routes.rb")
    end
  end
end
