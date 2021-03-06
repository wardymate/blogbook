require 'bcrypt'
class User

  include DataMapper::Resource

  property :id, Serial
  # property :username, String
  # property :name, String
  property :email, String, :unique => true, :message => "This email is already taken"
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)

  end

end
