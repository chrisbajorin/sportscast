class User < ActiveRecord::Base
  # attr_accessor :name, :email, :password_hash, :password_salt

  before_save :encrypt_password

  # has_secure_password

  def self.authenticate(email, password_hash)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password_hash, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password_hash.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password_hash, password_salt)
    end
  end

end
