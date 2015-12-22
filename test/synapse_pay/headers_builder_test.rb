require File.expand_path('../../test_helper', __FILE__)

module SynapsePay
  class HeadersBuilderTest < ::Test::Unit::TestCase

    setup do
      @headers = {
        :dog => "dog-value"
      }
      @api_key = "test-api-key"
      @built_headers = HeadersBuilder.build(@headers)
    end

    should 'set the content_type' do
      assert(@built_headers.has_key?("Content-Type" ))
      assert_equal( "application/json", @built_headers['Content-Type'])
    end

    should 'set the user_agent' do
      assert(@built_headers.has_key?(:user_agent))
      assert(@built_headers[:user_agent].include?(SynapsePay::VERSION))
      assert(@built_headers[:user_agent].include?(SynapsePay.api_version))
    end

  end
end
