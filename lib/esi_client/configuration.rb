# frozen_string_literal: true

require_relative "configuration/container"

module EsiClient
  module Configuration
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= ::EsiClient::Configuration::Container.new
    end
  end
end
