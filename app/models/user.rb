require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password_hash, presence: true

  include BCrypt


  def password=(password_attempt)
    self.password_hash = BCrypt::Password.create(password_attempt)
  end

  def password
    @password_hash ||= BCrypt::Password.new(password_hash)
  end

  def authenticate(password_attempt)
    self.password == password_attempt
  end

end
