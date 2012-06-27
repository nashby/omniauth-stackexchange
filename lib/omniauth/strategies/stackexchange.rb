require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class StackExchange < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.stackexchange.com/2.0',
        :authorize_url => 'https://stackexchange.com/oauth',
        :token_url => 'https://stackexchange.com/oauth/access_token'
      }

      option :token_params, {
        :parse => :query
      }

      def request_phase
        super
      end

      uid { raw_info['user_id'] }

      info do
        {
          'nickname' => raw_info['display_name'],
          'image' => raw_info['profile_image'],
          'urls' => {
             'StackOverflow' => raw_info['link']
           },

        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('me', :params => params).parsed['items'].first
      end

      def params
        {
          :site => 'stackoverflow',
          :access_token => access_token.token,
          :key => options.public_key
        }
      end
    end
  end
end

OmniAuth.config.add_camelization 'stackexchange', 'StackExchange'
