require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Oauth2 strategy for StackExchange sites
    class StackExchange < OmniAuth::Strategies::OAuth2
      class NotRegisteredForStackExchangeSiteError < StandardError; end

      option :client_options,
             site: 'https://api.stackexchange.com/2.0',
             authorize_url: 'https://stackexchange.com/oauth',
             token_url: 'https://stackexchange.com/oauth/access_token'

      option :token_params, parse: :query

      def request_phase
        super
      end

      uid { raw_info['user_id'] }

      info do
        {
          'nickname' => raw_info['display_name'],
          'image' => raw_info['profile_image'],
          'urls' => {
            site => raw_info['link']
          }
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get(
          'me', params: params
        ).parsed['items'].first

        unless @raw_info
          raise NotRegisteredForStackExchangeSiteError,
                "User is not registered for requested
                StackExchange site (#{site})"
        end

        @raw_info
      end

      def params
        {
          site: site,
          access_token: access_token.token,
          key: options.public_key
        }
      end

      def site
        request.env['omniauth.params']['site'] ||
          options.site ||
          'stackoverflow'
      end

      def callback_phase
        super
      rescue NotRegisteredForStackExchangeSiteError => e
        fail!(:user_is_not_registered, e)
      end
    end
  end
end

OmniAuth.config.add_camelization 'stackexchange', 'StackExchange'
