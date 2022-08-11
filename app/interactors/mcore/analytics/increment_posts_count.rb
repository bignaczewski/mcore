module Mcore
  module Analytics
    class IncrementPostsCount
      include Interactor

      def call
        unless context.user.update!(posts_count: context.user.posts_count + 1)
          context.fail!(message: "Could not update user posts count, errors: #{context.user.errors.messages}")
        end

        # context.fail!(message: 'Fail on purpose')
      end

      def rollback
        context.user.update!(posts_count: user.posts_count - 1)
      end
    end
  end
end