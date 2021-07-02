class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password_digest, presence: true, confirmation: true, length: { minimum: 8 }

  # this callback will run before saving on create and update
  before_save :downcase_email

  private
      def downcase_email
          self.email.downcase!
      end
end
