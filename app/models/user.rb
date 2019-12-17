class User < ApplicationRecord
    before_create {self.remember_token = Digest::SHA1.hexdigest SecureRandom.urlsafe_base64.to_s}

    has_secure_password
end
