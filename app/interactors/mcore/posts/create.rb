module Mcore
  module Posts
    class Create
      include Interactor

      def call
        context.post = context.user.posts.create(context.post_params)

        unless context.post.persisted?
          context.fail!
        end
      end

      def rollback
        context.post.destroy!
      end
    end
  end
end