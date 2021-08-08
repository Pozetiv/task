# frozen_string_literal: true

module Auth
  extend ActiveSupport::Concern
  API_KEY = 'kz4biUvVEBsQ0HU7'

  included do
    before_action :authorizate

    private

    def current_user_id
      @current_user_id ||= decoded_token&[0]&['auth_user_id']
    end

    def encode_token(payload)
      JWT.encode(payload, API_KEY, 'HS256')
    end

    def auth_header
      request.headers['Authorization']
    end

    def decoded_token
      return nil unless auth_header

      token = auth_header.split(' ')[1]
      JWT.decode(token, API_KEY, true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end

    def add_auth_header(token)
      response.set_header('Authorization', "Basic #{token}")
    end

    def authorizate
      return if current_user_id

      user_id = SecureRandom.uuid
      token = encode_token(auth_user_id: user_id)
      add_auth_header(token)
      @current_user_id = user_id
    end
  end
end
