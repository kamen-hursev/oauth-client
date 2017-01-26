require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, 'doorkeeper'
      option :client_options,
             site: 'http://localhost:3000',
             authorize_url: '/oauth/authorize'

      uid do
        raw_info['email']
      end

      info do
        {
          email: raw_info['email']
        }
      end

      def raw_info
        @raw_info ||= access_token.to_hash
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
