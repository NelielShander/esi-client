# frozen_string_literal: true

require 'uri'
require 'securerandom'
require 'base64'
require 'net/http'

module EveClient
  class EsiAuthNative
    attr_reader :client_id, :code_verifier
    attr_accessor :code

    def initialize
      @client_id = ::EveClient.configuration.client_id
      @code_verifier = SecureRandom.hex(32)
    end

    def eve_sso_link
      params = {
        response_type: 'code',
        redirect_uri: 'https://localhost/callback',
        client_id: client_id,
        scope: 'esi-characters.read_blueprints.v1',
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
      self.code = Hash[arr]['code']
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
      headers = {
        'content-type': 'application/x-www-form-urlencoded',
        'host': 'login.eveonline.com'
      }

      res = Net::HTTP.post(uri, data, **headers)
      res.body
    end

    private

    def code_challenge(code_verifier)
      Base64.urlsafe_encode64(
        OpenSSL::Digest::SHA256.digest(code_verifier)
      ).gsub(/=/, '')
    end
  end
end
