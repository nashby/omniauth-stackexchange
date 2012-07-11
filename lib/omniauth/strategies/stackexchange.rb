require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class StackExchange < OmniAuth::Strategies::OAuth2
      class NotRegisteredForStackExchangeSiteError < StandardError; end
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
          'url' => raw_info['link']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        #first check to see if a specific site was specified in the request
        site_id = request.env['omniauth.params']['site'] ? request.env['omniauth.params']['site'] : nil

        #if no site was specified in the request, pull from omniauth.rb
        site_id = options.site ? options.site : nil if site_id.nil?

        #raise an error if no site was provided
        if site_id.nil?
          raise 'At least one site api key must be provided in omniauth.rb or passed as a parameter'
        end

        @raw_info ||= access_token.get('me', :params => {:site => site_id, :access_token => access_token.token, :key => options.public_key}).parsed['items'].first
        if @raw_info.nil?
          raise NotRegisteredForStackExchangeSiteError, 'User is not registered for requested StackExchange site (' + site_id + ')'
        end
        @raw_info
      end

      def params
        {
          :access_token => access_token.token,
          :key => options.public_key
        }
      end
    end
  end
end

OmniAuth.config.add_camelization 'stackexchange', 'StackExchange'
