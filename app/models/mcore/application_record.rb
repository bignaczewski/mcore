# frozen_string_literal: true

module Mcore
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
