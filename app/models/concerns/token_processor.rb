module TokenProcessor
  extend ActiveSupport::Concern

  def set_access_token attributes={}
    self.current_token = generated_token
    self.access_tokens.create(attributes.merge({token: self.current_token}))
  end

  def generated_token
    SecureRandom.urlsafe_base64(32).tr('lIO0', 'sxyz')
  end
end
