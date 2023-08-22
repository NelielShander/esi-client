# frozen_string_literal: true

require "net/http"
require "json"
require "jwt"

require_relative "esi_client/version"
require_relative "esi_client/configuration"
require_relative "esi_client/scope_data"
require_relative "esi_client/eve_sso"

module EsiClient
  module_function

  extend Configuration

  def request
    scopes = ScopeData::DATA.keys.take(1).join(" ")
    eve_sso = EveSso.instance

    puts "redirect to authorize > #{eve_sso.authorize_link(scopes)}"
    print "paste browser link > "

    browser_link = gets.strip
    authorization_code = extract_code(browser_link)
    eve_sso.code = authorization_code

    puts "your code is '#{authorization_code}'"

    jwt_token = eve_sso.post_authorization_code

    token_type = jwt_token["token_type"]
    refresh_token = jwt_token["refresh_token"]

    puts "your token_type is '#{token_type}'"
    puts "your token expires_in #{jwt_token["expires_in"]} seconds"
    puts "your refresh_token '#{refresh_token}'"

    eve_sso.jwt_token = jwt_token
    eve_sso.refresh_token = refresh_token

    decode_payload jwt_token["access_token"]
  end

  def extract_code(url_string)
    URI.parse(url_string)
      .query
      .then { |query| URI.decode_www_form(query) }
      .to_h
      .fetch("code")
  end

  def decode_payload(access_token = "")
    JWT.decode access_token, nil, false, {algorithm: "RS256"}
  end
end
