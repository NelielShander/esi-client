# frozen_string_literal: true

require 'net/http'
require 'json'

require_relative 'eve_client/version'
require_relative 'eve_client/esi_auth_native'
require_relative 'eve_client/configuration'
require_relative 'eve_client/scope'

module EveClient
  extend ::EveClient::Configuration
  module_function

  def sample_request
    esi_auth = EsiAuthNative.new
    scope = 'esi-assets.read_assets.v1'
    esi_auth.authorize scope
    token = esi_auth.jwt_token['access_token']
    character_id = esi_auth.decode_payload.dig(0, 'sub').split(':').last

    get_request "characters/#{character_id}/assets/", token
  end

  def get_request(path, token = nil)
    uri = URI.join('https://esi.evetech.net/latest/', path)
    uri.query = URI.encode_www_form({ datasource: 'tranquility' })
    headers = { 'accept': 'application/json', 'cache-control': 'no-cache' }
    headers.merge! 'authorization': "Bearer #{token}" if token

    response = Net::HTTP.get_response(uri, **headers)
    JSON.parse response.body
  end
end
