module Mcore
  module Concerns
    module JsonBuilder
      module User
        def to_builder
          Jbuilder.new do |user|
            user.id id
            user.first_name first_name
            user.last_name last_name
            user.email email
            user.address address
          end
        end
      end
    end
  end
end