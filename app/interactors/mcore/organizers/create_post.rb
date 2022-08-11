module Mcore
  module Organizers
    class CreatePost
      include Interactor::Organizer

      organize Mcore::Posts::Create,
               Mcore::Analytics::IncrementPostsCount,
               Mcore::Notifications::SendEmail
    end
  end
end
