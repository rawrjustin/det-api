class User < ActiveRecord::Base
  before_create :set_auth_token
  
  private
    def set_auth_token
      return if token.present?

      begin
        self.token = SecureRandom.hex
      end while self.class.exists?(token: self.token)
    end
end
