class User < ApplicationRecord
  include Authenticatable
  include TokenProcessor

  attr_accessor :current_token

  has_many :access_tokens, dependent: :destroy

  def self.find_by_credentials(credentials)
    user = self.find_by(email: credentials.fetch(:email, ''))
    user if user.present? && user.valid_password?(credentials.fetch(:password, ''))
  end
end
