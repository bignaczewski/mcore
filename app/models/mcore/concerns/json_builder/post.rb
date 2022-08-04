module Mcore
  module Concerns
    module JsonBuilder
      module Post
        def to_builder
          Jbuilder.new do |post|
            post.id id
            post.user_id user_id
            post.title title
            post.body body
          end
        end
      end
    end
  end
end