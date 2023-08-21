# frozen_string_literal: true

require "singleton"
require "base64"

module EsiClient
  class EveSso
    include Singleton

    SSO_OAUTH_URL = "https://login.eveonline.com/v2/oauth"

    attr_reader :configuration, :code_verifier
    attr_accessor :code, :jwt_token, :refresh_token

    def initialize
      @configuration = ::EsiClient.configuration
      @code_verifier = SecureRandom.hex(32)
    end

    def authorize_link(scope = "")
      params = {
        response_type: "code",
        redirect_uri: configuration.redirect_uri,
        client_id: configuration.client_id,
        scope:,
        state: "unique-state",
        code_challenge:,
        code_challenge_method: "S256"
      }

      uri = URI.parse("#{SSO_OAUTH_URL}/authorize")
      uri.query = URI.encode_www_form(params)
      uri.to_s
    end

    def post_authorization_code
      payload = {
        grant_type: "authorization_code",
        code:,
        client_id: configuration.client_id,
        code_verifier:
      }
      headers = {
        "content-type" => "application/x-www-form-urlencoded",
        "host" => "login.eveonline.com"
      }

      post_payload(payload, headers)
    end

    def refresh_access_token
      payload = {
        grant_type: "refresh_token",
        refresh_token:
      }
      headers = {
        "content-type" => "application/x-www-form-urlencoded",
        "host" => "login.eveonline.com",
        "authorization" => basic_authorization
      }

      post_payload(payload, headers)
    end

    private

    def code_challenge
      #noinspection RubyResolve
      OpenSSL::Digest::SHA256
        .digest(code_verifier)
        .then { |digest| Base64.urlsafe_encode64(digest) }
        .gsub("=", "")
    end

    def basic_authorization
      "#{configuration.client_id}:#{configuration.secret_key}"
        .then { |string| Base64.urlsafe_encode64(string) }
        .then { |basic| "Basic #{basic}" }
    end

    def post_payload(payload, headers)
      uri = URI.parse("#{SSO_OAUTH_URL}/token")
      data = URI.encode_www_form(payload)

      Net::HTTP.post(uri, data, **headers)
        .then { |response| JSON.parse response.body }
    end
  end
end
