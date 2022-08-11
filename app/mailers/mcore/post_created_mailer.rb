module Mcore
  class PostCreatedMailer < ApplicationMailer
    default from: 'bartosz@mcore.eu'

    def send_notification
      @post = params[:post]
      @user = @post.user
      mail(to: @user.email, subject: 'Post created')
    end
  end
end
