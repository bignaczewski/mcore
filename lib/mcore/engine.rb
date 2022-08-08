# frozen_string_literal: true

require 'draper'
require 'interactor'

module Mcore
  class Engine < ::Rails::Engine
    isolate_namespace Mcore

    initializer :append_migrations do |app|
      # unless app.root.to_s.match root.to_s
      config.paths['db/migrate'].expanded.each do |expanded_path|
        app.config.paths['db/migrate'] << expanded_path
      end
    end
  end
end
