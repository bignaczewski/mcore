module Mcore
  class User < ApplicationRecord
    self.table_name = 'users'
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :posts, :class_name => Mcore::Post.to_s
  end
end
