# frozen_string_literal: true

require 'uri'
require 'securerandom'
require 'base64'
require 'jwt'

module EveClient
  class EsiAuthNative
    attr_accessor :jwt_token
    attr_reader :client_id, :code, :code_verifier

    def initialize
      @client_id = ::EveClient.configuration.client_id
      @code_verifier = SecureRandom.hex(32)
    end

    def authorize(scope)
      puts eve_sso_link(scope)
      copy_code gets&.strip
      @jwt_token = JSON.parse(send_token_request)
    end

    def decode_payload
      JWT.decode jwt_token['access_token'], nil, false, { :algorithm => 'RS256' }
    end

    private

    def eve_sso_link(scope)
      params = {
        response_type: 'code',
        redirect_uri: 'https://localhost/callback',
        client_id: client_id,
        scope: scope,
        state: 'unique-state',
        code_challenge: code_challenge(code_verifier),
        code_challenge_method: 'S256'
      }

      uri = URI.parse("https://login.eveonline.com/v2/oauth/authorize/")
      uri.query = URI.encode_www_form(params)
      uri.to_s
    end

    def copy_code(url_string)
      query = URI.parse(url_string).query || ''
      arr = URI.decode_www_form(query)
      @code = Hash[arr]['code']
    end

    def send_token_request
      uri = URI.parse('https://login.eveonline.com/v2/oauth/token')
      payload = {
        grant_type: 'authorization_code',
        code: code,
        client_id: client_id,
        code_verifier: code_verifier
      }
      data = URI.encode_www_form(payload)
      headers = { 'content-type': 'application/x-www-form-urlencoded', 'host': 'login.eveonline.com' }

      response = Net::HTTP.post(uri, data, **headers)
      response.body
    end

    def code_challenge(code_verifier)
      Base64.urlsafe_encode64(
        OpenSSL::Digest::SHA256.digest(code_verifier)
      ).gsub(/=/, '')
    end
  end
end
