# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: {
    case_sensitive: true
  }
  validates :name, length: {
    minimum: 4
  }
  validates :email, length: {
    minimum: 8
  }

  before_create { self.remember_token = Digest::SHA1.hexdigest SecureRandom.urlsafe_base64.to_s }

  has_secure_password
end
