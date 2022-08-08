module Mcore
  module Notifications
    class SendEmail
      include Interactor

      # async calls should be performed at the end
      def call
        unless Mcore::PostCreatedMailer.with(post: context.post).send_notification.deliver_later
          context.fail!(message: 'Email delivery failed')
        end
      end
    end
  end
end