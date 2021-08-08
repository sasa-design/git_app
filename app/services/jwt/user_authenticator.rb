module Jwt::UserAuthenticator
  extend self
  
  def call(request_headers)
    @request_headers = request_headers
    begin
      payload = Jwt::TokenDecryptor.call(@request_headers)
      User.find(payload['user_id'])
    rescue StandardError
      nil
    end
  end
  
end
