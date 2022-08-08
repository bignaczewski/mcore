module Mcore
  class Post < ApplicationRecord
    self.table_name = 'posts'

    belongs_to :user

    # TODO: messages should inform what is the min/max number
    validates_length_of :title, within: 3..20, too_long: 'needs to be shorter', too_short: 'needs to be longer'
    validates_length_of :body, within: 3..500, too_long: 'is too long', too_short: 'is too short'
  end
end
