# frozen_string_literal: true
#
require_relative 'configuration/container'

module EveClient
  module Configuration
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= ::EveClient::Configuration::Container.new
    end
  end
end
