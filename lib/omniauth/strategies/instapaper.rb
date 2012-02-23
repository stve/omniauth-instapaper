require 'omniauth-xauth'

module OmniAuth
  module Strategies
    class Instapaper < OmniAuth::Strategies::XAuth
      option :client_options, {
        :site               => 'http://www.instapaper.com/',
        :access_token_url   => 'https://www.instapaper.com/api/1/oauth/access_token'
      }
      option :xauth_options, { :title => 'OmniAuth Instapaper'}

      uid { raw_info['user_id'] }

      info do
        { 'name' => raw_info['username'] }
      end

      extra do
        {'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get("https://www.instapaper.com/api/1/account/verify_credentials").body).first
      end

    end
  end
end