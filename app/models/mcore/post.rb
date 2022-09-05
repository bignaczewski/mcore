module Mcore
  class Post < ApplicationRecord
    self.table_name = 'posts'
    belongs_to :user
  end
end
