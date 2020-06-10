require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 2000
  DIGEST = OpenSSL::Digest::SHA256.new
  REGEXP_EMAIL = /[\w\.]+@[\w\.]+/
  REGEXP_USERNAME = /\A\w+\z/

  attr_accessor :password

  has_many :questions, dependent: :destroy

  validates :username, presence:true, uniqueness: true,
      format: { with: REGEXP_USERNAME }, length: { maximum: 40 }
  validates :email, presence:true, uniqueness: true, format: { with: REGEXP_EMAIL }
  validates :password, presence: true, on: :create
  validates :password, confirmation: true

  before_save :encrypt_password, :downcase_character

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    hashed_password = User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(
      password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
    return user if user.password_hash == hashed_password
    nil
  end

  def downcase_character
    self.username.downcase!
    self.email.downcase!
  end

  private

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(
          self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
        )
    end
  end
end
