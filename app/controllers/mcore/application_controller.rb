# frozen_string_literal: true

module Mcore
  class ApplicationController < ActionController::Base
    include Mcore::Concerns::ApplicationCommon
  end
end
