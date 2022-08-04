module Mcore
  class User < ApplicationRecord
    self.table_name = 'users'

    include Concerns::JsonBuilder::User

    has_many :posts, dependent: :destroy

    validates_presence_of :first_name, :last_name
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  end
end
