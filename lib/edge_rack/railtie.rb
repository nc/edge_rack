module EdgeRack
  class Railtie < Rails::Railtie
    initializer "edge_rack.configure_rails_initialization" do |app|
      if Rails.env.development?
        app.middleware.use EdgeRack::Middleware
      end
    end
  end
end