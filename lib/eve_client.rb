# frozen_string_literal: true

require_relative 'eve_client/version'
require_relative 'eve_client/esi_auth_native'
require_relative 'eve_client/esi_auth_web'
require_relative 'eve_client/configuration'
require_relative 'eve_client/scope'

module EveClient
  extend ::EveClient::Configuration
  module_function

  def sample_request
    Scope::Alliances.new.read_contacts
  end
end
