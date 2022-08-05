# frozen_string_literal: true
# require 'facade/client/index_facade'

module Mcore
  class Engine < ::Rails::Engine
    isolate_namespace Mcore
    config.eager_load_paths += Dir["#{config.root}/lib"]
    initializer :append_migrations do |app|
      # unless app.root.to_s.match root.to_s
      # byebug
      # config.eager_load_paths += Dir["#{config.root}/lib"]
      # config.autoload_paths << File.expand_path(Dir["#{config.root}/lib"])
      # config.autoload_paths << File.expand_path('../lib/facade', __FILE__)
      # byebug
      config.eager_load_paths += Dir["#{config.root}/lib"]
      config.paths['db/migrate'].expanded.each do |expanded_path|
        app.config.paths['db/migrate'] << expanded_path
      end
    end
  end
end
