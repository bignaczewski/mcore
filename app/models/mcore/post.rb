module Mcore
  class Post < ApplicationRecord
    self.table_name = 'posts'

    include Concerns::JsonBuilder::Post

    belongs_to :user

    # TODO: messages should inform what is the min/max number
    validates_length_of :title, within: 3..20, too_long: 'pick a shorter title', too_short: 'pick a longer title'
    validates_length_of :body, within: 3..500, too_long: 'that is too long', too_short: 'that is too short'
  end
end
