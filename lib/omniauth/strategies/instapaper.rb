require 'omniauth-xauth'

module OmniAuth
  module Strategies
    class Instapaper < OmniAuth::Strategies::XAuth
      option :client_options, {
        :site               => 'https://www.instapaper.com',
        :access_token_path   => '/api/1/oauth/access_token'
      }
      option :xauth_options, { :title => 'OmniAuth Instapaper'}

      uid { raw_info['user_id'] }

      info do
        { 'name' => raw_info['username'] }
      end

      extra do
        {'raw_info' => raw_info }
      end

      def get_credentials
        OmniAuth::Form.build(options.xauth_options) do
          text_field 'Email or Username', 'username'
          password_field 'Password', 'password'
        end.to_response
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get("/api/1/account/verify_credentials").body).first
      end

    end
  end
end