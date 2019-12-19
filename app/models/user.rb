class User < ApplicationRecord
  attr_accessor :activation_token
  has_secure_password
  before_create :remember
  has_many :posts

  # Returns the hash digest of the given string.
  def self.digest(string)
    Digest::SHA1.hexdigest string
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.digest(User.new_token)
  end

  def update_remember_token(new_token)
    update_attribute(:remember_token, User.digest(new_token))
  end

  def forget
    update_attribute(:remember_token, nil)
  end

  private

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(remember_token)
  end
end
