require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, presence: true

  include BCrypt


  def password
    @password ||= Password.new(password_hash)
  end


  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password_attempt)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    @user = User.find_by email: email
    if @user && @user.password == password_attempt
      return @user
    end
    nil
  end

  def get_name
    self.first_name
  end

end
