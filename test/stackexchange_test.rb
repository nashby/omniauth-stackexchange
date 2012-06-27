require 'test_helper'

describe OmniAuth::Strategies::StackExchange do
  let(:stackexchange) do
    OmniAuth::Strategies::StackExchange.new({})
  end

  it 'has correct site' do
    stackexchange.options.client_options.site.must_equal("https://api.stackexchange.com/2.0")
  end

  it 'has correct authorize url' do
    stackexchange.options.client_options.authorize_url.must_equal('https://stackexchange.com/oauth')
  end

  it 'has correct token url' do
    stackexchange.options.client_options.token_url.must_equal('https://stackexchange.com/oauth/access_token')
  end
end
