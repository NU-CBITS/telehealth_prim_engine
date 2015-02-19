module TelehealthPrimEngine
  # The account for an administrator.
  class User < ActiveRecord::Base
    devise :database_authenticatable, :timeoutable, :lockable, :recoverable,
           :trackable, :validatable, timeout_in: 20.minutes

    validates :superuser, :researcher, :content_author,
              inclusion: { in: [true, false] }
  end
end
